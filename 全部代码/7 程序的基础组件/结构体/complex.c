#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

typedef struct
{
    int drink; // 喝水
} Animal_t;

typedef struct
{
    Animal_t animal; // 父类
    uint64_t sleep;  // 睡眠
    struct
    {
        int height; // 身高
        int weight; // 体重
    };
    int runSpeed; // 属性，奔跑速度

    void (*runFunc)(Dog_t *dog); // 方法，奔跑
} Dog_t;

// 画图，嵌套struct的布局
// 由内部struct获得外部struct

// struct的本质是一块内存，包含多个属性，属性用偏移量定位。
