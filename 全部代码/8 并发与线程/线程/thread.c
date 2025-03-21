#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdint.h>
#include <syscall.h>
#include <sched.h>
#include <stdbool.h>

#define cpuid sched_getcpu()    // CPU ID
#define pid syscall(SYS_getpid) // 进程ID
#define tid syscall(SYS_gettid) // 线程ID

pthread_mutex_t mutex; // 锁
pthread_cond_t cond1;  // 条件变量
pthread_cond_t cond2;  // 条件变量
pthread_cond_t cond3;  // 条件变量

volatile int curr_seq = 0;  // 当前序号
volatile int max_seq = 8;   // 最大序号
volatile bool go_on = true; // 是否继续

// 打印
void print_seq()
{
    printf(" thread = %d  cpu = %d  seq = %2d \n", tid, cpuid, curr_seq);
    ++curr_seq;             // 序号加1
    if (curr_seq > max_seq) // 超过限制
    {
        go_on = false; // 不再继续
        printf(" thread = %d  set  go_on = false \n", tid);
    }
    sleep(1); // 休眠线程
}

void thread_created()
{
    int tmp = 1;
    printf(" thread = %d  stack_addr = %p \n", tid, &tmp);
}

// 挂起线程
int cond_wait(pthread_cond_t *cond)
{
    pthread_mutex_lock(&mutex);
    int ret = pthread_cond_wait(cond, &mutex);
    pthread_mutex_unlock(&mutex);
    return ret;
}

// 唤醒线程
int cond_notify(pthread_cond_t *cond)
{
    pthread_mutex_lock(&mutex);
    int ret = pthread_cond_broadcast(cond);
    pthread_mutex_unlock(&mutex);
    return ret;
}

// 线程1的函数
void *thread_func1(void *param)
{
    thread_created();
    cond_wait(&cond3); // 挂起线程
    while (1)
    {
        if (!go_on) // 不再运行
        {
            cond_notify(&cond1); // 唤醒线程
            break;
        }
        print_seq();         // 打印
        cond_notify(&cond1); // 唤醒线程
        cond_wait(&cond3);   // 挂起线程
    }
    printf(" thread = %d  exit \n", tid);
    return NULL;
}

// 线程2的函数
void *thread_func2(void *param)
{
    thread_created();
    cond_wait(&cond1); // 挂起线程
    while (1)
    {
        if (!go_on) // 不再运行
        {
            cond_notify(&cond2); // 唤醒线程
            break;
        }
        print_seq();         // 打印
        cond_notify(&cond2); // 唤醒线程
        cond_wait(&cond1);   // 挂起线程
    }
    printf(" thread = %d  exit \n", tid);
    return NULL;
}

// 线程3的函数
void *thread_func3(void *param)
{
    thread_created();
    cond_wait(&cond2); // 挂起线程
    while (1)
    {
        if (!go_on) // 不再运行
        {
            cond_notify(&cond3); // 唤醒线程
            break;
        }
        print_seq();         // 打印
        cond_notify(&cond3); // 唤醒线程
        cond_wait(&cond2);   // 挂起线程
    }
    printf(" thread = %d  exit \n", tid);
    return NULL;
}

int main()
{
    // 进程
    printf(" process = %d \n", pid);
    // 主线程
    printf(" main thread = %d \n", tid);

    // 初始化，锁、条件变量
    pthread_mutex_init(&mutex, NULL);
    pthread_cond_init(&cond1, NULL);
    pthread_cond_init(&cond2, NULL);
    pthread_cond_init(&cond3, NULL);

    // 创建线程
    pthread_t t1;
    pthread_create(&t1, NULL, thread_func1, NULL);
    pthread_t t2;
    pthread_create(&t2, NULL, thread_func2, NULL);
    pthread_t t3;
    pthread_create(&t3, NULL, thread_func3, NULL);
    sleep(1);
    printf(" threads  created \n");

    printf(" input char to continue . \n");
    char ch;
    scanf("%c", &ch);

    // 唤醒线程
    cond_notify(&cond3);

    // 主线程等待子线程结束
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);

    // 销毁，锁、条件变量
    pthread_cond_destroy(&cond1);
    pthread_cond_destroy(&cond2);
    pthread_cond_destroy(&cond3);
    pthread_mutex_destroy(&mutex);

    printf(" threads  exit \n");
    return 0;
}