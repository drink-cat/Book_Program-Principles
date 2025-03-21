#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <pthread.h>
#include <sys/time.h>
#include <time.h>

// 消息，有填充
struct msg_with_pad
{
    char pad_before[56]; // 前方填充，56字节
    int64_t count;       // 数据，8字节
    char pad_after[56];  // 后方填充，56字节
};

// 消息，没有填充
struct msg_no_pad
{
    int64_t count; // 数据，8字节
};

// 2个数组。
struct msg_with_pad msg_with_pad_array[3];
struct msg_no_pad msg_no_pad_array[3];

// 获得毫秒
uint64_t get_millis()
{
    struct timeval val;
    gettimeofday(&val, NULL);
    uint64_t millis = val.tv_sec * 1000;
    millis += val.tv_usec / 1000;
    return millis;
}

// 最大循环次数
int loop_max = 90000000;

// 线程，操作有填充的结构
void *thread_with_pad(void *param)
{
    // 当前线程操作的下标
    int *index_ptr = (int *)param;
    int index = *index_ptr;
    // 循环很多次
    for (int k = 0; k < loop_max; ++k)
    {
        // 写值。触发缓存同步
        msg_with_pad_array[index].count = 3333;
    }
    return NULL;
}

// 线程，操作没有填充的结构
void *thread_no_pad(void *param)
{
    // 当前线程操作的下标
    int *index_ptr = (int *)param;
    int index = *index_ptr;
    // 循环很多次
    for (int k = 0; k < loop_max; ++k)
    {
        // 写值。触发缓存同步
        msg_no_pad_array[index].count = 3333;
    }
    return NULL;
}

int main()
{
    printf(" struct msg_with_pad size = %d \n", sizeof(struct msg_with_pad));
    printf(" struct msg_no_pad   size = %d \n", sizeof(struct msg_no_pad));
    printf("\n");

    // 多个线程，分别操作多个数组元素
    int index0 = 0;
    int index1 = 1;
    int index2 = 2;

    // 有填充。解决了伪共享。
    uint64_t begin_millis_with_pad = get_millis();
    pthread_t t1;
    pthread_create(&t1, NULL, thread_with_pad, &index0);
    pthread_t t2;
    pthread_create(&t2, NULL, thread_with_pad, &index1);
    pthread_t t3;
    pthread_create(&t3, NULL, thread_with_pad, &index2);
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);
    uint64_t cost_millis_with_pad = get_millis() - begin_millis_with_pad;
    printf(" with_pad cost_millis = %llu \n", cost_millis_with_pad);

    // 没有填充。有伪共享问题。
    uint64_t begin_millis_no_pad = get_millis();
    pthread_t t5;
    pthread_create(&t5, NULL, thread_no_pad, &index0);
    pthread_t t6;
    pthread_create(&t6, NULL, thread_no_pad, &index1);
    pthread_t t7;
    pthread_create(&t7, NULL, thread_no_pad, &index2);
    pthread_join(t5, NULL);
    pthread_join(t6, NULL);
    pthread_join(t7, NULL);
    uint64_t cost_millis_no_pad = get_millis() - begin_millis_no_pad;
    printf(" no_pad   cost_millis = %llu \n", cost_millis_no_pad);
    printf("\n");
    return 0;
}