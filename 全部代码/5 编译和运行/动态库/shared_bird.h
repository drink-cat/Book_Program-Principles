#ifndef _SHARED_BIRD_H_
#define _SHARED_BIRD_H_

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 占位。忽略。
extern int32_t shared_unused;

// main 使用此变量
extern int32_t shared_color;

// main 不使用此变量
extern int32_t shared_speed;

// 占位。忽略。
extern int32_t shared_unused2;

// main 使用此函数
extern void shared_dance();

// main 不使用此函数
extern void shared_smile();

// 小工具。输出符号的地址和值
void print_symbol(char *desc, uint64_t addr, int32_t value)
{
    printf("%-20s  addr = %#14llX", desc, addr);
    if (value != 0)
    {
        printf("    value = %#X ", value);
    }
    printf("\n");
}

#endif
