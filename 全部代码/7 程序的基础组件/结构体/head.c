#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// 动物
struct Animal
{
    char animal_name[16];
    int32_t animal_color;
};

// 鸟
struct Bird
{
    struct Animal animal;   // 第1个属性
    double bird_fly_height; // 第2个属性
};

// 动物的方法
void animal_sleep(struct Animal *animal)
{
    printf("Animal addr = %p \n", animal);
    printf("Animal %s with color %#x is sleeping \n\n",
           animal->animal_name, animal->animal_color);
}

// 鸟的方法
void bird_fly(struct Bird *bird)
{
    printf("Bird addr = %p \n", bird);
    printf("Bird %s is flying at height %f \n\n",
           bird->animal.animal_name, bird->bird_fly_height);
}

// 变量。
struct Bird lucy;

int main()
{
    // 初始化
    sprintf(lucy.animal.animal_name, "Lucy");
    lucy.animal.animal_color = 0xF1D6C8B7;
    lucy.bird_fly_height = 22.33D;

    printf("struct Animal  size = %d \n\n", sizeof(struct Animal));
    printf("struct Bird    size = %d \n\n", sizeof(struct Bird));

    // 调用动物的方法
    animal_sleep((struct Animal *)&lucy);

    // 调用鸟的方法
    bird_fly(&lucy);

    return 0;
}
