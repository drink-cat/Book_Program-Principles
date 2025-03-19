#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// so中的变量
int32_t so_param = 3333;

// 变量的代理。在GOT
uint64_t so_param_GOT = (uint64_t)&so_param;

// 函数的代理。在GOT
void so_func();
uint64_t so_func_GOT = (uint64_t)&so_func;

// so中的函数
void so_func()
{
    // 用代理，取变量的地址
    uint64_t param_addr = so_param_GOT;
    // 用代理，取变量的值
    int32_t param_value = *((int32_t *)param_addr);
    // 用代理，取函数的地址
    uint64_t func_addr = so_func_GOT;

    printf("\n == so_func() == \n");
    printf("so_param   addr = %#llx  value = %d \n", param_addr, param_value);
    printf("so_func()  addr = %#llx  \n", func_addr);
    printf("\n");
}

//--------------------------------

// 重新定义一个变量。对应 so_param
int32_t main_param = 0;

// 函数的代理。对应 so_func 。这里简单示意。
uint64_t so_func_PLT = 0;

int main()
{
    // 动态重定位。指向main的变量
    so_param_GOT = (uint64_t)&main_param;
    // 动态重定位。指向main的变量
    so_func_GOT = (uint64_t)&so_func_PLT;

    //---------------------------------------
    // 初始化，把so的变量的值拷贝过来
    main_param = so_param;

    //---------------------------------------
    // 修改main的变量
    main_param = 6666;
    // 动态重定位。这里省略动态查找函数的过程
    so_func_PLT = (uint64_t)&so_func;

    //---------------------------------------
    // 用代理，调用so的函数。这里简单示意。
    void (*tmp_func)();
    tmp_func = (void (*)())so_func_PLT;
    tmp_func();

    //---------------------------------------
    // 查看so的变量
    uint64_t so_param_addr = (uint64_t)&so_param;
    int32_t so_param_value = so_param;
    // 查看main的变量
    uint64_t main_param_addr = (uint64_t)&main_param;
    int32_t main_param_value = main_param;

    printf("\n == main() == \n");
    printf("so_param     addr = %#llx  value = %d \n", so_param_addr, so_param_value);
    printf("main_param   addr = %#llx  value = %d \n", main_param_addr, main_param_value);
    printf("\n");

    //---------------------------------------
    // 函数的地址
    uint64_t so_func_addr = (uint64_t)&so_func;
    uint64_t so_func_PLT_addr = (uint64_t)&so_func_PLT;
    printf("so_func        addr = %#llx \n", so_func_addr);
    printf("so_func_PLT    addr = %#llx value = %#llx \n", so_func_PLT_addr, so_func_PLT);
    printf("\n");

    // GOT的地址和值
    printf("so_param_GOT   addr = %#llx value = %#llx \n", &so_param_GOT, so_param_GOT);
    printf("so_func_GOT    addr = %#llx value = %#llx \n", &so_func_GOT, so_func_GOT);
    printf("\n");

    return 0;
}
