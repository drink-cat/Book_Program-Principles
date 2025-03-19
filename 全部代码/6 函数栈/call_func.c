#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

// 函数名的数字后缀，表示函数的调用顺序
// 为了便于讲解，这里没有调用外部函数

void func_1()
{
}

void func_2_1_1()
{
}

void func_2_1_2()
{
}

void func_2_1()
{
    func_2_1_1();
    func_2_1_2();
}

void func_2()
{
    func_2_1();
}

int main()
{
    func_1();
    func_2();
    return 0;
}
