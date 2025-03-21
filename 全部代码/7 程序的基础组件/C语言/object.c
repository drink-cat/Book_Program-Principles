#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 动物。
struct Animal
{
    // 名称
    char name[30];
};

// 可以飞行
struct FlyAnimal
{
    // 继承父类
    struct Animal animal;
    // 飞行高度
    double flyHeight;
    // 函数，飞行
    void (*flyFunc)(struct FlyAnimal *flyAnimal);
};

// 鸟。
struct Bird
{
    // 继承父类
    struct FlyAnimal flyAnimal;
    // 唱歌时长
    int singMinute;
    // 鸟，唱歌。
    void (*birdSingFunc)(struct Bird *bird);
};

// 蜜蜂
struct Bee
{
    // 继承父类
    struct FlyAnimal flyAnimal;
    // 鸟，采花蜜。
    void (*beeFlowerFunc)(struct Bee *bee);
};

void func_fly(struct FlyAnimal *flyAnimal)
{
    printf("%s 飞行，高度 %.1f 米 \n", flyAnimal->animal.name, flyAnimal->flyHeight);
}

void func_bird_sing_less(struct Bird *bird)
{
    printf("鸟 %s 唱歌 %d 分钟 \n", bird->flyAnimal.animal.name, bird->singMinute);
}

void func_bird_sing_more(struct Bird *bird)
{
    printf("鸟 %s 在白杨树的枝头，唱歌 %d 分钟，美丽动听 \n",
           bird->flyAnimal.animal.name, bird->singMinute);
}

void func_bee_flower_less(struct Bee *bee)
{
    printf("蜜蜂 %s 采花蜜，只采了1分钟 \n", bee->flyAnimal.animal.name);
}

void func_bee_flower_more(struct Bee *bee)
{
    printf("蜜蜂 %s 慢悠悠地采花蜜5小时 \n", bee->flyAnimal.animal.name);
}

int main()
{
    printf("\n Bird : \n");
    struct Bird bird_tom;

    // 名称，写到父类的属性。
    sprintf((bird_tom.flyAnimal.animal.name), "bird_tom");

    // 设置子类的属性
    bird_tom.singMinute = 3;

    // 设置父类的属性和方法
    bird_tom.flyAnimal.flyHeight = 200;
    bird_tom.flyAnimal.flyFunc = func_fly;

    // 调用父类的方法
    bird_tom.flyAnimal.flyFunc((struct FlyAnimal *)&bird_tom);

    // 调用子类的方法
    bird_tom.birdSingFunc = func_bird_sing_less;
    bird_tom.birdSingFunc(&bird_tom);

    // 更换方法，调用方法
    bird_tom.birdSingFunc = func_bird_sing_more;
    bird_tom.birdSingFunc(&bird_tom);

    // --------------------------
    printf("\n Bee : \n");
    struct Bee bee_jerry;
    sprintf((bee_jerry.flyAnimal.animal.name), "bee_jerry");

    // 设置父类的属性和方法
    bee_jerry.flyAnimal.flyHeight = 3;
    bee_jerry.flyAnimal.flyFunc = func_fly;

    // 调用父类的方法
    bee_jerry.flyAnimal.flyFunc((struct FlyAnimal *)&bee_jerry);

    // 调用子类的方法
    bee_jerry.beeFlowerFunc = func_bee_flower_less;
    bee_jerry.beeFlowerFunc(&bee_jerry);

    // 更换方法，调用方法
    bee_jerry.beeFlowerFunc = func_bee_flower_more;
    bee_jerry.beeFlowerFunc(&bee_jerry);

    return 0;
}
