#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

// 全局变量
int global_age = 300;

// 方法
int print_age(int age)
{
    // 局部变量
    int age_plus = age + 5;
    // 第一个参数是字符串
    printf("age = %d \n", age_plus);
}

// 主函数
int main()
{
    // 局部变量
    int local_age = 200;

    // 调用方法
    print_age(global_age);

    // 调用方法
    print_age(local_age);

    return 0;
}
