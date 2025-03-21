#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <pthread.h>

// 公共变量。让2个线程同时操作，形成相互依赖。
int aa = 0;
int bb = 0;
int read_aa = 55;
int read_bb = 55;

// 操作公共变量
void thread_func1()
{
    aa = 3;
    asm volatile("mfence" ::: "memory"); // 内存屏障指令
    read_bb = bb;
}

// 操作公共变量
void thread_func2()
{
    bb = 3;
    asm volatile("mfence" ::: "memory"); // 内存屏障指令
    read_aa = aa;
}

// 初始化。
void init()
{
    aa = 0;
    bb = 0;
    read_aa = 55;
    read_bb = 55;
}

// 控制2个子线程。
volatile bool thread_stop = false; // 子线程，停止
volatile bool thread_wait1 = true; // 第一个子线程，等待
volatile bool thread_wait2 = true; // 第二个子线程，等待

void *thread_loop1(void *arg)
{
    while (!thread_stop)
    {
        // 为1，等待。为0，跳过。
        while (thread_wait1)
        {
        }

        // 操作公共变量
        thread_func1();

        // 等待下一次同步操作
        thread_wait1 = true;
    }
    printf("线程1，退出。\n");
}

void *thread_loop2(void *arg)
{
    while (!thread_stop)
    {
        // 为1，等待。为0，跳过。
        while (thread_wait2)
        {
        }

        // 操作公共变量
        thread_func2();

        // 等待下一次同步操作
        thread_wait2 = true;
    }
    printf("线程2，退出。\n");
}

int main()
{
    printf("主线程，开始。\n");
    // 创建2个线程，操作公共变量。
    pthread_t t1;
    pthread_t t2;
    pthread_create(&t1, NULL, thread_loop1, NULL);
    pthread_create(&t2, NULL, thread_loop2, NULL);

    // 循环尝试。
    int count = 0;
    while (true)
    {
        ++count;

        // 初始化公共变量。
        init();
        // printf("主线程，让子线程执行。  count=%d \n", count);

        // 让2个子线程，执行操作公共变量。
        thread_wait1 = false;
        thread_wait2 = false;

        // 等待2个子线程，都操作一次。
        while (!thread_wait1)
        {
        }
        while (!thread_wait2)
        {
        }

        // 判断是否发生指令乱序。
        if (read_aa == 0 && read_bb == 0)
        {
            printf("遇到情况：(read_aa == 0 && read_bb == 0)  count=%d \n", count);
            break;
        }
        if (count % 1000000 == 0)
        {
            printf("循环次数=%d \n", count);
        }
    }

    // 让子线程退出。
    thread_stop = true;
    thread_wait1 = false;
    thread_wait2 = false;

    sleep(1);
    printf("主线程，退出。\n");
    return 0;
}