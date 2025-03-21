#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdint.h>
#include <syscall.h>
#include <sched.h>

#define tid syscall(SYS_gettid) // 线程ID

void *thread_func(void *param)
{
    int taskid = tid;
    printf(" thread = %d  created\n", taskid);
    int64_t num = 0;

    // 循环
    while (1)
    {
        // 复杂的计算
        int64_t tmp = taskid * 55 - 99;
        tmp = (tmp << 3) + 77;
        tmp = tmp / (taskid - 66);
        num += tmp;
    }
    printf(" thread = %d  output = %lld \n", taskid, num);
    return NULL;
}

int main()
{
    printf(" main thread = %d \n", tid);

    // 创建线程
    pthread_t t1;
    pthread_create(&t1, NULL, thread_func, NULL);
    pthread_t t2;
    pthread_create(&t2, NULL, thread_func, NULL);
    sleep(1);
    printf(" threads are created \n");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    printf(" after threads exit \n");
    return 0;
}