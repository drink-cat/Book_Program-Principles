#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

void func_6()
{
    int tmp = 100;
    printf("func_6  param addr = %p  %llu \n", &tmp, (uint64_t)&tmp);
}

void func_5()
{
    int tmp = 100;
    printf("func_5  param addr = %p  %llu \n", &tmp, (uint64_t)&tmp);
    func_6();
}

void func_4()
{
    int tmp = 100;
    printf("func_4  param addr = %p  %llu \n", &tmp, (uint64_t)&tmp);
    func_5();
}

void func_3()
{
    int tmp = 100;
    printf("func_3  param addr = %p  %llu \n", &tmp, (uint64_t)&tmp);
    func_4();
}

void func_2()
{
    int tmp = 100;
    printf("func_2  param addr = %p  %llu \n", &tmp, (uint64_t)&tmp);
    func_3();
}

void func_1()
{
    int tmp = 100;
    printf("func_1  param addr = %p  %llu \n", &tmp, (uint64_t)&tmp);
    func_2();
}

int main()
{
    int tmp = 100;
    printf("main    param addr = %p  %llu \n", &tmp, (uint64_t)&tmp);
    func_1();
    return 0;
}
