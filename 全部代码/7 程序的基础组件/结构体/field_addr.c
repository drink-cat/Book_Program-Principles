#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 一个简单的struct
typedef struct
{
    int32_t height; // 4字节
    int32_t weight; // 4字节
    int64_t speed;  // 8字节
    int32_t notUse; // 4字节
} Cat_t;

// 输出信息。
void print_cat(char *title, Cat_t *cat)
{
    printf("\n %s \n", title);
    printf("struct  addr = %p %llu \n", cat, (uint64_t)cat);
    printf("height  addr = %p %llu  value = %d \n", &cat->height, (uint64_t)&cat->height, cat->height);
    printf("weight  addr = %p %llu  value = %d \n", &cat->weight, (uint64_t)&cat->weight, cat->weight);
    printf("speed   addr = %p %llu  value = %lld \n", &cat->speed, (uint64_t)&cat->speed, cat->speed);
    printf("notUse  addr = %p %llu  value = %d \n", &cat->notUse, (uint64_t)&cat->notUse, cat->notUse);
}

// 数据区
Cat_t cat_red;

int main()
{
    // struct的大小
    printf("Cat_t size = %d \n", sizeof(Cat_t));

    // 数据区
    cat_red.height = 111;
    cat_red.weight = 222;
    cat_red.speed = 333;
    cat_red.notUse = 0;

    // 堆区
    Cat_t *cat_blue = malloc(sizeof(Cat_t));
    cat_blue->height = 444;
    cat_blue->weight = 555;
    cat_blue->speed = 666;
    cat_blue->notUse = 0;

    // 栈区
    Cat_t cat_grey;
    cat_grey.height = 777;
    cat_grey.weight = 888;
    cat_grey.speed = 999;
    cat_grey.notUse = 0;

    print_cat("in Data area : ", &cat_red);
    print_cat("in Heap area : ", cat_blue);
    print_cat("in Stack area : ", &cat_grey);

    return 0;
}
