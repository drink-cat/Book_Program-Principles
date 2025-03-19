#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 普通的变量。在 .data
int32_t param_tree = 0xEEEEEEEE;

// 普通的方法。在 .text
void func_print(char *desc, void *addr)
{
    printf(" %16s    addr = %10p \n", desc, addr);
}

// -------------------------------------------

// 自定义section
__attribute__((section("eee_data")))
int32_t eee_color = 0xA1A2A3A4;

// 自定义section
__attribute__((section("eee_data")))
int64_t eee_height = 0x7172737475767778;

// 自定义section
__attribute__((section("eee_data_2")))
int32_t eee_speed = 0xB1B2B3B4;

// 自定义section
__attribute__((section("www_data")))
int32_t www_fish = 0x91929394;

// 占位的符号。标记内存地址。
float eee_data_begin;
char eee_data_inner;
short eee_data_end;

// 自定义section
__attribute__((section("ddd_func"))) int ddd_func_dance(int time)
{
    return time + 300;
}

int main()
{
    // 普通的变量。在 .data
    printf("\n Param in default section : \n");
    func_print("param_tree", &param_tree);

    // 自定义section的变量
    printf("\n Param in custom section : \n");
    func_print("eee_color", &eee_color);
    func_print("eee_height", &eee_height);
    func_print("eee_speed", &eee_speed);
    func_print("www_fish", &www_fish);

    // 占位的符号。标记内存地址。
    printf("\n Place symbol : \n");
    func_print("eee_data_begin", &eee_data_begin);
    func_print("eee_data_inner", &eee_data_inner);
    func_print("eee_data_end", &eee_data_end);

    // 普通的方法。在 .text
    printf("\n Func in default section : \n");
    func_print("func_print", func_print);

    // 自定义section
    printf("\n Func in custom section : \n");
    func_print("ddd_func_dance", ddd_func_dance);

    return 0;
}
