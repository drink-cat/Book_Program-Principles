#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "bird.h"
#include "dog.h"

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
    bird_fly();
    dog_run();

    // 查看变量的地址、值。
    printf("\nparam addr and value : \n");
    main_print_param("bird_height", &bird_height, bird_height);
    main_print_param("dog_speed", &dog_speed, dog_speed);
    main_print_param("main_int", &main_int, main_int);

    // 查看方法的地址。
    printf("\nfunc addr :  \n");
    main_print_func("bird_fly", bird_fly);
    main_print_func("dog_run", dog_run);
    main_print_func("main", main);

    // 休眠。方便查看内存布局。
    sleep(80000);
    return 0;
}
