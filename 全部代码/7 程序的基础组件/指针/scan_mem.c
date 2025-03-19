#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

struct cat
{
    int32_t cat_age;
    float cat_height;
};

// 32位整数
int32_t today = 11;
// 32位浮点数
float degree = 22.22F;
// 结构体
struct cat cat_tom = {.cat_age = 55, .cat_height = 66.66F};
// 64位整数
uint64_t level = 0x55667788AABBCCDD;

int main()
{
    // 地址。
    uint64_t addr = (uint64_t)&today;
    printf(" addr  =  %llu \n\n", addr);
    // 指针。指向单个字节。
    char *ptr = (char *)addr;

    // 用指针遍历内存。
    // 地址依次加4。
    int32_t value_today = *((int32_t *)(ptr + 0));
    float value_degree = *((float *)(ptr + 4));
    int32_t value_cat_age = *((int32_t *)(ptr + 8));
    float value_cat_height = *((float *)(ptr + 12));
    uint32_t value_level_1 = *((uint32_t *)(ptr + 16));
    uint32_t value_level_2 = *((uint32_t *)(ptr + 20));

    printf("     today  =  %d  \n", value_today);
    printf("    degree  =  %.2f  \n", value_degree);
    printf("   cat_age  =  %d  \n", value_cat_age);
    printf(" cat_height =  %.2f  \n", value_cat_height);
    printf("   level_1  =  %#X  \n", value_level_1);
    printf("   level_2  =  %#X  \n", value_level_2);
    return 0;
}
