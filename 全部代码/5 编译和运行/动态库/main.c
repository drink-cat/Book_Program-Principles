#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "shared_bird.h"

// 变量
int32_t main_month = 0xF1F2F3F4;

void main_print()
{
    // 占位。忽略。
    uint64_t unused_addr = (uint64_t)&shared_unused;
    uint64_t unused2_addr = (uint64_t)&shared_unused2;
    int tmp1 = 0x111111;

    // 取地址
    uint64_t color_addr = (uint64_t)&shared_color;
    uint64_t month_addr = (uint64_t)&main_month;
    uint64_t shared_func_addr = (uint64_t)&shared_dance;
    // 外部so的函数 printf
    uint64_t func_printf_addr = (uint64_t)&printf;
    int tmp2 = 0x222222;

    // 取值
    int32_t color_value = shared_color;
    int32_t month_value = main_month;
    int tmp3 = 0x333333;

    printf("== main_print() == \n");
    print_symbol("shared_color", color_addr, color_value);
    print_symbol("main_month", month_addr, month_value);
    print_symbol("shared_dance()", shared_func_addr, 0);
    print_symbol("printf()", func_printf_addr, 0);
    printf("\n");
}

int main()
{
    // 修改动态库的变量
    shared_color = 0x71727374;

    // 查看ELF文件，找到shared_dance的.got.plt
    uint64_t shared_dance_GOT_PLT_addr = 0x000000601030;
    uint64_t *shared_dance_GOT_PLT_ptr = (uint64_t *)shared_dance_GOT_PLT_addr;
    // 调用 shared_dance() 之前，查看.got.plt的值
    uint64_t shared_dance_GOT_PLT_value = *shared_dance_GOT_PLT_ptr;

    // 调用动态库的函数
    shared_dance();

    // 调用 shared_dance() 之后，查看.got.plt的值
    printf("== main  section  .GOT.PLT == \n");
    uint64_t shared_dance_GOT_PLT_value2 = *shared_dance_GOT_PLT_ptr;
    printf("shared_dance_GOT_PLT  before call = %#14llX  \n", shared_dance_GOT_PLT_value);
    printf("shared_dance_GOT_PLT  after  call = %#14llX  \n", shared_dance_GOT_PLT_value2);
    printf("\n");

    // 调用main的函数
    main_print();

    // 休眠进程。方便查看内存布局。
    sleep(900000);
    return 0;
}
