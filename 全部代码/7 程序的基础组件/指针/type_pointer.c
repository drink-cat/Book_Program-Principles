#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

// 整数的指针
int32_t int32 = 200;
int32_t *int32_ptr = &int32;

// 浮点数的指针
double float64 = 555.55;
double *float64_ptr = &float64;

// 数组的指针
int16_t int16_arr[3] = {7, 8, 9};
int16_t *int16_arr_ptr = &(int16_arr[1]);

void func_cat_run(int speed)
{
    printf(" func Cat is running at speed %d \n", speed);
}
// 函数的指针
void (*func_ptr)(int param) = func_cat_run;

int main()
{
    // 用指针修改变量。
    *int32_ptr = 300;
    *float64_ptr = 666.66;

    // 用指针调用函数。
    func_ptr(77);

    return 0;
}
