#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Bird;

// struct 只包含方法。一类方法打包在一起。
struct BirdFunc
{
    void (*fly)(struct Bird *bird);  // 飞行
    void (*sing)(struct Bird *bird); // 唱歌
};

// struct 实体
struct Bird
{
    char name[30];   // 属性
    double flySpeed; // 属性

    struct BirdFunc *birdFunc; // 方法集合
};

void func_fly_fast(struct Bird *bird)
{
    printf(" %s 飞行很快，速度达到了 %.1f \n", bird->name, bird->flySpeed);
}
void func_fly_slow(struct Bird *bird)
{
    printf(" %s 飞行很慢，速度只有 %.1f \n", bird->name, bird->flySpeed);
}
void func_sing_good(struct Bird *bird)
{
    printf(" %s 唱歌好听 good \n", bird->name);
}
void func_sing_bad(struct Bird *bird)
{
    printf(" %s 唱歌一般 bad \n", bird->name);
}

// 麻雀的方法
struct BirdFunc sparrowFunc = {
    .fly = func_fly_fast,
    .sing = func_sing_good};

// 大雁的方法
struct BirdFunc gooseFunc = {
    .fly = func_fly_slow,
    .sing = func_sing_bad};

int main()
{
    // 一个对象
    struct Bird blue_bird;
    sprintf(blue_bird.name, "蓝色的小鸟");
    blue_bird.flySpeed = 100;

    // 小鸟，如果是麻雀，使用麻雀的方法集合
    blue_bird.birdFunc = &sparrowFunc;
    blue_bird.birdFunc->fly(&blue_bird);
    blue_bird.birdFunc->sing(&blue_bird);

    printf("\n ====  切换函数集合前后  ====  \n\n");

    // 小鸟，如果是大雁，使用大雁的方法集合
    blue_bird.birdFunc = &gooseFunc;
    blue_bird.birdFunc->fly(&blue_bird);
    blue_bird.birdFunc->sing(&blue_bird);

    return 0;
}
