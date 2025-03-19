#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "cat.h"

int main_int = 0x61626364;

void main_print_param(char *name, void *addr, int value)
{
    printf(" %15s  addr = %p  value = %#X \n", name, addr, value);
}

void main_print_func(char *name, void *addr)
{
    printf(" %15s  addr = %p   \n", name, addr);
}

int main()
{
    // 重置变量。
    main_int = 0xF1F2F3F4;

    // 调用函数。
    cat_run(3);

    // 查看变量的地址、值。
    printf("\nparam addr and value : \n");
    main_print_param("cat_speed", &cat_speed, cat_speed);
    main_print_param("main_int", &main_int, main_int);

    // 查看方法的地址。
    printf("\nfunc addr :  \n");
    main_print_func("cat_run", cat_run);
    main_print_func("main", main);

    // 休眠。方便查看内存布局。
    sleep(90000);
    return 0;
}
