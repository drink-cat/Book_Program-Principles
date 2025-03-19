#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct cat
{
    char desc[64];
};

int32_t count_loop = 0;      // 计数，循环
int32_t count_recursion = 0; // 计数，递归
int32_t count_max = 100;     // 最大计数

// 记录循环的变量的地址
uint64_t loop_begin_addr;
uint64_t loop_end_addr;

// 循环
void func_loop()
{
    for (; count_loop <= count_max; count_loop++)
    {
        // 栈上的变量
        struct cat tom;
        if (count_loop == 0)
        {
            loop_begin_addr = (uint64_t)&tom;
            printf("\n loop begin . at %#llX \n", loop_begin_addr);
        }
        if (count_loop == count_max)
        {
            loop_end_addr = (uint64_t)&tom;
            printf("\n loop end   . at %#llX  offset = %llu \n", loop_end_addr,
                   (loop_begin_addr - loop_end_addr));
        }
    }
}

// 记录递归的变量的地址
uint64_t recursion_begin_addr;
uint64_t recursion_end_addr;

// 递归
void func_recursion()
{
    // 退出递归
    if (count_recursion > count_max)
    {
        return;
    }
    // 栈上的变量
    struct cat tom;
    if (count_recursion == 0)
    {
        recursion_begin_addr = (uint64_t)&tom;
        printf("\n recursion begin . at %#llX \n", recursion_begin_addr);
    }
    else if (count_recursion == count_max)
    {
        recursion_end_addr = (uint64_t)&tom;
        printf("\n recursion end   . at %#llX  offset = %llu \n", recursion_end_addr,
               (recursion_begin_addr - recursion_end_addr));
    }
    // 调用自身
    ++count_recursion;
    func_recursion();
}

int main()
{
    printf(" struct cat size = %d \n", sizeof(struct cat));

    func_loop();
    func_recursion();
    return 0;
}