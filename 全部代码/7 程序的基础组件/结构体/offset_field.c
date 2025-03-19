#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct River
{
    int32_t river_width; // 4字节
    int32_t river_depth; // 4字节
};

struct Fish
{
    int64_t fish_length; // 8字节
    struct River river;  // 8字节

    void (*fish_swim)(struct Fish *fish); // 8字节
};

// 获得某个属性的偏移。极简版。
#define field_off(field_name) \
    (uint64_t)(&(((struct Fish *)0)->field_name))

// 获得某个属性的偏移。与 field_off 功能等价。
// 1 地址0转为struct指针。
// 2 属性指针指向属性。
// 3 属性指针转为64位整数。
#define field_off_2(field_name, off_ptr)     \
    do                                       \
    {                                        \
        struct Fish *tmp = (struct Fish *)0; \
        void *addr = &(tmp->field_name);     \
        uint64_t off = (uint64_t)addr;       \
        *off_ptr = off;                      \
    } while (0)

void func_river(struct River *river)
{
    // 属性的偏移。
    uint64_t off = field_off(river);
    // struct Fish 的地址
    uint64_t base_addr = (uint64_t)river - off;
    // struct Fish 指针
    struct Fish *fish = (struct Fish *)base_addr;

    printf("\n");
    printf("River addr = %llu \n", (uint64_t)river);
    printf("Fish  addr = %llu \n", base_addr);
    printf("\n");
    printf("River width = %d  depth = %d \n", river->river_width, river->river_depth);
    printf("Fish  length = %lld \n", fish->fish_length);

    // 调用方法
    fish->fish_swim(fish);
}

void func_fish_swim(struct Fish *fish)
{
    printf("Fish {length=%lld} is swimming in River {width=%d depth=%d} \n",
           fish->fish_length, fish->river.river_depth, fish->river.river_width);
}

// 变量
struct Fish fish;

int main()
{
    // 用2种方式，取属性的偏移
    uint64_t river_off1 = field_off(river);
    printf("river_off1 = %llu \n", river_off1);
    uint64_t river_off2;
    field_off_2(river, &river_off2);
    printf("river_off2 = %llu \n", river_off2);

    uint64_t river_depth_off = field_off(river.river_depth);
    printf("river_depth_off = %llu \n", river_depth_off);

    // 变量
    fish.fish_length = 100;
    fish.river.river_width = 3;
    fish.river.river_depth = 2;
    fish.fish_swim = func_fish_swim;

    // 方法。入参为属性指针。
    func_river(&(fish.river));

    return 0;
}
