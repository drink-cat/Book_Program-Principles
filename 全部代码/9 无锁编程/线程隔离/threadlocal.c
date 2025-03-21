#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdint.h>
#include <syscall.h>

// 一个threadlocal变量的标识
pthread_key_t key_count;

// 销毁threadlocal变量的回调
void key_destroy_callback(void *arg)
{
    int tid = syscall(SYS_gettid);
    printf(" key_destroy  thread = %d  arg_addr = %p \n", tid, arg);
    free(arg);
}

// 获得threadlocal变量。没有就新建。
uint64_t *get_threadlocal_count()
{
    // 获得threadlocal变量
    uint64_t *ptr = pthread_getspecific(key_count);
    if (NULL == ptr)
    {
        // 每个变量申请新的内存
        ptr = malloc(sizeof(uint64_t));
        *ptr = 0;
        // 设置threadlocal变量
        pthread_setspecific(key_count, ptr);
    }
    return ptr;
}

void *thread_func(void *param)
{
    // 循环操作多次
    for (int i = 0; i < 90000000; ++i)
    {
        // 操作threadlocal变量
        uint64_t *ptr = get_threadlocal_count();
        ++(*ptr);
    }

    // 打印结果
    int tid = syscall(SYS_gettid);
    uint64_t *ptr = get_threadlocal_count();
    printf(" thread = %d  count_addr = %p  count_value = %llu \n",
           tid, ptr, *ptr);
    sleep(1);
    return NULL;
}

int main()
{
    // 创建key
    pthread_key_create(&key_count, key_destroy_callback);
    printf(" key_count = %u \n", key_count);

    // 创建多个线程
    pthread_t t1;
    pthread_create(&t1, NULL, thread_func, NULL);
    pthread_t t2;
    pthread_create(&t2, NULL, thread_func, NULL);
    pthread_t t3;
    pthread_create(&t3, NULL, thread_func, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);
    pthread_key_delete(key_count);
    sleep(1);
    return 0;
}