#include "shared_bird.h"

// 占位。忽略。
int32_t shared_unused = 0xA1A2A3A4;

// main 使用此变量
int32_t shared_color = 0xB1B2B3B4;

// 本地变量，外部不可见
static int32_t local_height = 0xC1C2C3C4;

// main 不使用此变量
int32_t shared_speed = 0x91929394;

// 占位。忽略。
int32_t shared_unused2 = 0x31323334;

// so在内存的首地址。查看elf和dump，找到local_func的偏移。
#define so_base_addr ((uint64_t) & local_func - 0x00097c)

// 本地函数。外部不可见。
static void local_func()
{
    printf("== shared  section  .GOT == \n");
    // 查看elf和dump。用偏移找到 GOT 的地址。
    uint64_t got_addr = so_base_addr + 0x201fb0;
    // 代理存放64位地址。依次遍历。
    uint64_t *got_ptr = (uint64_t *)got_addr;
    int k;
    for (k = 0; k < 8; k++)
    {
        uint64_t *tmp_ptr = got_ptr + k;
        uint64_t tmp_value = *tmp_ptr;
        printf("GOT   addr = %p   value = %#14llX \n", tmp_ptr, tmp_value);
    }
    printf("\n");
}

// main 不使用此函数
void shared_smile()
{
    printf("== shared_smile() == \n");
}

// main 使用此函数
void shared_dance()
{
    // 取地址
    uint64_t color_addr = (uint64_t)&shared_color;
    uint64_t height_addr = (uint64_t)&local_height;
    uint64_t speed_addr = (uint64_t)&shared_speed;
    int tmp1 = 111111;

    // 取值
    int32_t color_value = shared_color;
    int32_t height_value = local_height;
    int32_t speed_value = shared_speed;
    int tmp2 = 222222;

    // 查看初始的变量
    uint64_t color_addr_init = height_addr - 4;
    int32_t color_value_init = *((int32_t *)color_addr_init);

    // 共享函数的地址
    uint64_t shared_dance_addr = (uint64_t)&shared_dance;
    uint64_t shared_smile_addr = (uint64_t)&shared_smile;

    // 本地函数的地址
    uint64_t local_func_addr = (uint64_t)&local_func;

    // 查看elf和dump，找到 shared_dance 的偏移。
    uint64_t shared_dance_addr_init = so_base_addr + 0x000a19;

    // 外部so的函数
    // main使用了函数 printf
    uint64_t func_printf_addr = (uint64_t)&printf;
    // main没有使用函数 execvp
    uint64_t func_execvp_addr = (uint64_t)&execvp;
    int tmp3 = 333333;

    printf("== shared_dance() == \n");
    print_symbol("shared_color", color_addr, color_value);
    print_symbol("shared_color_init", color_addr_init, color_value_init);
    print_symbol("local_height", height_addr, height_value);
    print_symbol("shared_speed", speed_addr, speed_value);

    print_symbol("local_func()", local_func_addr, 0);
    print_symbol("shared_smile()", shared_smile_addr, 0);
    print_symbol("shared_dance()", shared_dance_addr, 0);
    print_symbol("shared_dance()_real", shared_dance_addr_init, 0);

    print_symbol("printf()", func_printf_addr, 0);
    print_symbol("execvp()", func_execvp_addr, 0);
    printf("\n");

    // 调用本地函数
    local_func();
}
