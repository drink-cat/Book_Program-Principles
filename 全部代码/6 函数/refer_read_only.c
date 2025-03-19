#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 值传递
void func_value(int64_t speed, double height)
{
    int64_t tmp_int = speed + 666;
    double tmp_double = height + 666;
}

// 引用传递
void func_pointer(int64_t *speed, double *height)
{
    int64_t tmp_int = *speed + 666;
    double tmp_double = *height + 666;
}

// 2个变量
int64_t speed = 120;
double height = 33.55F;

int main()
{
    func_value(speed, height);
    func_pointer(&speed, &height);
    return 0;
}