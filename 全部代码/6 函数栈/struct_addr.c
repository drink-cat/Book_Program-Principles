#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// struct 包含多个属性
typedef struct
{
    // 使用64位，更直观
    int64_t score1;
    int64_t score2;
} study_t;

// 变量在数据区
study_t Jack = {
    .score1 = 100,
    .score2 = 200,
};

int main()
{
    // 变量在函数栈
    study_t Bob;
    Bob.score1 = 500;
    Bob.score2 = 600;

    printf("Jack 全局变量 : \n");
    printf("  struct  addr = %p   \n", &Jack);
    printf("  score1  addr = %p  value = %lld \n", &Jack.score1, Jack.score1);
    printf("  score2  addr = %p  value = %lld \n", &Jack.score2, Jack.score2);
    printf("\n");

    printf("Bob  局部变量 : \n");
    printf("  struct  addr = %p   \n", &Bob);
    printf("  score1  addr = %p  value = %lld \n", &Bob.score1, Bob.score1);
    printf("  score2  addr = %p  value = %lld \n", &Bob.score2, Bob.score2);
    printf("\n");

    return 0;
}