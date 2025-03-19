#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 结构体
typedef struct
{
    // 每个属性使用64位，更直观
    // 设置多个属性，使用栈传递struct，对比效果更明显
    int64_t age;
    int64_t speed;
    int64_t height;
    int64_t weight;
} cat_t;

// 值传递。作为入参
void func_value_as_param(cat_t cat)
{
    cat.age = 100;
    cat.speed = 200;
    cat.height = 300;
    cat.weight = 400;
}

// 值传递。作为返回值
cat_t func_value_as_return()
{
    cat_t cat;
    cat.age = 500;
    cat.speed = 600;
    cat.height = 700;
    cat.weight = 800;
    return cat;
}

// 引用传递。指针类型
cat_t *func_value_pointer(cat_t *cat)
{
    cat->age = 1000;
    cat->speed = 2000;
    cat->height = 3000;
    cat->weight = 4000;
    return cat;
}

void print_cat(char *title, cat_t *cat)
{
    printf("  %s  addr = %p  age = %lld  speed = %lld  height = %lld  weight = %lld \n",
           title, cat, cat->age, cat->speed, cat->height, cat->weight);
}

// 全局变量
cat_t cat_tom;

int main()
{
    // 初始化
    cat_tom.age = 1;
    cat_tom.speed = 2;
    cat_tom.height = 3;
    cat_tom.weight = 4;

    printf("值传递：作为入参 \n");
    print_cat("调用前", &cat_tom);
    func_value_as_param(cat_tom);
    print_cat("调用后", &cat_tom);
    printf("\n");

    printf("值传递：作为返回值 \n");
    cat_t cat_red = func_value_as_return();
    print_cat("调用后", &cat_red);
    printf("\n");

    printf("引用传递：指针 \n");
    print_cat("调用前", &cat_tom);
    func_value_pointer(&cat_tom);
    print_cat("调用后", &cat_tom);
    printf("\n");

    return 0;
}