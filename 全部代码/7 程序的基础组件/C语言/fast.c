#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct cat
{
    int32_t cat_age;
    int32_t cat_speed;
};

// 整数
int32_t int32_aa = 0x11223344;
int32_t int32_bb = 0x55667788;
// 数组
int32_t int32_arr[2] = {0xCCCCCCCC, 0xDDDDDDDD};
// 结构体
struct cat cat_tom = {.cat_age = 0xA1A2A3A4, .cat_speed = 0xB1B2B3B4};

// ---------------------------------
void func_bird_fly(int height)
{
    printf(" func Bird is flying at height %d \n", height);
}

void func_cat_run(int speed)
{
    printf(" func Cat is running at speed %d \n", speed);
}

void (*func_ptr)(int param);

void print_int32(char *desc, int32_t *ptr)
{
    // 指针转为地址
    uint64_t addr = (uint64_t)ptr;
    // 指针读数据
    int32_t val = *ptr;
    printf(" %15s   addr = %llu   value = %#X  \n", desc, addr, val);
}

int main()
{
    // 打印地址、值
    print_int32("int32_aa", &int32_aa);
    print_int32("int32_bb", &int32_bb);
    print_int32("int32_arr[0]", &(int32_arr[0]));
    print_int32("int32_arr[1]", &(int32_arr[1]));
    print_int32("cat_age", &(cat_tom.cat_age));
    print_int32("cat_speed", &(cat_tom.cat_speed));

    printf("\n === after modify int32 ===\n\n");

    // 指针
    int32_t *num_ptr;
    // 修改整数变量
    num_ptr = &int32_aa;
    *num_ptr = 0xAABBCCDD;
    // 修改结构体变量的属性
    num_ptr = &(cat_tom.cat_speed);
    *num_ptr = 0xC1C2C3C4;
    // 读指针
    int32_bb = *num_ptr;

    print_int32("int32_aa", &int32_aa);
    print_int32("cat_speed", &(cat_tom.cat_speed));

    printf("\n === see func pointer ===\n\n");

    // 调用函数
    func_ptr = func_bird_fly;
    func_ptr(200);
    func_ptr = func_cat_run;
    func_ptr(300);

    return 0;
}
