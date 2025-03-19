#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

// 函数没有入参
void func_no_param()
{
    printf("函数没有入参 \n");
}

// 函数有1个入参
void func_1_param(int age)
{
    printf("函数有1个入参 %d \n", age);
}

// 函数有5个入参
void func_5_param(int age, int age2, int age3, int age4, int age5)
{
    printf("函数有5个入参 %d %d %d %d %d \n", age, age2, age3, age4, age5);
}

// 函数有9个入参
void func_9_param(int age, int age2, int age3, int age4, int age5,
                  int age6, int age7, int age8, int age9)
{
    printf("函数有9个入参 %d %d %d %d %d %d %d %d %d \n", age, age2, age3,
           age4, age5, age6, age7, age8, age9);
}

// 函数有double/int入参
void func_double_int_param(double height, double height2, int age, int age2)
{
    printf("函数有double/int入参 %f %f %d %d \n", height, height2, age, age2);
}

int main()
{
    func_no_param();
    func_1_param(100);
    func_5_param(100, 200, 300, 400, 500);
    func_9_param(100, 200, 300, 400, 500, 600, 700, 800, 900);
    func_double_int_param(11.11, 22.22, 100, 200);
    return 0;
}