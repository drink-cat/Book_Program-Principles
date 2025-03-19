#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct Cat
{
    int64_t speed;
    int64_t color;
    int64_t age;
};

// 原始值
struct Cat tom = {
    .speed = 555,
    .color = 33,
    .age = 22};

// 复制
struct Cat copy;

// 指针
struct Cat *refer;

int main()
{
    // 值传递
    copy = tom;

    // 引用传递
    refer = &tom;

    printf("tom    addr = %p \n", &tom);
    printf("copy   addr = %p \n", &copy);
    printf("refer  addr = %p  value = %#llx \n", &refer, (uint64_t)refer);

    return 0;
}
