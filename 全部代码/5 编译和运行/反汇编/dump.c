#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 变量
int32_t bird_color = 0x51525354;
int64_t bird_speed = 0x7172737475767778;

// 结构体
struct cat
{
    int32_t color;
    int64_t speed;
};
struct cat tom = {
    .color = 0xC1C2C3C4,
    .speed = 0xD1D2D3D4D5D6D7D8};

// 函数
int32_t func_num(int32_t n)
{
    int32_t tmp = (n << 8) + 7;
    return tmp;
}

// 函数。打印地址。
void func_print_addr(char *desc, void *addr)
{
    printf(" %12s  addr = %p \n", desc, addr);
}

int main()
{
    // 变量地址
    func_print_addr("bird_color", &bird_color);
    func_print_addr("bird_speed", &bird_speed);
    func_print_addr("tom", &tom);
    func_print_addr("tom.color", &(tom.color));
    func_print_addr("tom.speed", &(tom.speed));

    // 函数地址
    func_print_addr("func_num", &(func_num));

    // 调用函数
    int32_t before = 0xA1A2A3A4;
    int32_t after = func_num(before);
    printf(" func_num  before = %#X  after = %#X \n", before, after);
    return 0;
}