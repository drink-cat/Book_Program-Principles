#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

typedef struct
{
    char name[8];     // 字符数组。8字节
    float height;     // 浮点数。4字节
    int32_t speed;    // 整数。4字节
    int64_t score[2]; // 数组。16字节
} Dog_t;

// 数据区
Dog_t dog;

int main()
{
    // 初始化
    sprintf(dog.name, "BoQiTa");
    dog.height = 22.33F;
    dog.speed = 555;
    dog.score[0] = 666;
    dog.score[1] = 777;

    // 变量地址
    void *ptr = &dog;
    printf("addr = %llu  struct  \n\n", (uint64_t)ptr);

    // 用偏移取属性
    char *name_ptr = ptr + 0;
    printf("addr = %llu  name = %s \n", (uint64_t)name_ptr, name_ptr);

    // 用偏移取属性
    float *height_ptr = ptr + 8;
    printf("addr = %llu  height = %f \n", (uint64_t)height_ptr, *height_ptr);

    // 用偏移取属性
    int32_t *speed_ptr = ptr + 12;
    printf("addr = %llu  speed = %d \n", (uint64_t)speed_ptr, *speed_ptr);

    // 用偏移取属性
    int64_t *score0 = ptr + 16;
    printf("addr = %llu  score[0] = %lld \n", (uint64_t)score0, *score0);

    // 用偏移取属性
    int64_t *score1 = ptr + 24;
    printf("addr = %llu  score[1] = %lld \n", (uint64_t)score1, *score1);

    return 0;
}