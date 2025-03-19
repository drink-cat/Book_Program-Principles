#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

// 定义 struct
typedef struct
{
    long long age; // 8个字节
    double height; // 8个字节
} cat_t;

// 一个全局变量 struct
cat_t Tom = {.age = 33, .height = 55};

// 函数返回1个全局变量的指针
cat_t *func_1_return_pionter()
{
    return &Tom;
}

// 函数返回1个栈内变量的指针
void *func_1_return_pionter2()
{
    // 仅供测试，真实场景不要把栈内地址返回到外部
    int buf;
    return &buf;
}

// 函数返回1个外部struct的拷贝
cat_t func_1_return_struct()
{
    return Tom;
}

int main()
{
    // 分别查看3种返回值
    cat_t *ptr1 = func_1_return_pionter();
    void *ptr2 = func_1_return_pionter2();
    cat_t cat = func_1_return_struct();

    printf("函数返回1个全局变量的指针     = %p \n", ptr1);
    printf("函数返回1个栈内变量的指针     = %p \n", ptr2);
    printf("函数返回1个外部struct的拷贝   = %p \n", &cat);

    // 暂停进程，查看内存布局
    sleep(9999999);
    return 0;
}
