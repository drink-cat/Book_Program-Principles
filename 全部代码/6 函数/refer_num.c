#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 值传递，简单数字
int func_value_num(int day)
{
    day = 3;
    return day;
}

// 引用传递，简单数字。使用指针
int *func_refer_num_pointer(int *month)
{
    (*month) = 11;
    return month;
}

// 引用传递，简单数字。使用64位地址
uint64_t func_refer_num_u64(uint64_t year_addr)
{
    // 把地址转为指针，再操作
    int *tmp = (int *)year_addr;
    *tmp = 2023;
    return year_addr;
}

int day = 2;
int month = 9;
int year = 1970;
int main()
{
    printf("值传递：  \n");
    printf("   调用前 = %d  \n", day);
    int day_out = func_value_num(day);
    printf("   调用后 = %d  \n", day);
    printf("   返回值 = %d  \n", day_out);
    printf("\n");

    printf("引用传递，指针模式：  \n");
    printf("   调用前 = %d  \n", month);
    // 直接传指针
    int *month_out = func_refer_num_pointer(&month);
    printf("   调用后 = %d  \n", month);
    printf("   返回值 = %p  \n", month_out);
    printf("\n");

    printf("引用传递，64位地址模式：  \n");
    printf("   调用前 = %d  \n", year);
    // 获得64位地址
    uint64_t year_addr = (uint64_t)(&year);
    uint64_t year_out = func_refer_num_u64(year_addr);
    printf("   调用后 = %d  \n", year);
    printf("   返回值 = %#llx  \n", year_out);
    printf("\n");

    return 0;
}
