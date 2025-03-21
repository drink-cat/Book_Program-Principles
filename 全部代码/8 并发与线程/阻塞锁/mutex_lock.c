#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <syscall.h>

// 给初始值，使得在汇编文件看到定义
pthread_mutex_t mutexlock = {
    .__data.__lock = 1,
    .__data.__count = 2,
    .__data.__owner = 3,
    .__data.__nusers = 4,
    .__data.__kind = 5};
pthread_mutexattr_t mutexattr;

// 打印锁的信息
void print_lock(char *title)
{
    printf(" %s  __lock=%d __count=%d __owner=%d \n", title,
           mutexlock.__data.__lock, mutexlock.__data.__count, mutexlock.__data.__owner);
}

// 线程执行加锁
void *thread_func_lock(void *param)
{
    pid_t os_tid = syscall(SYS_gettid); // 线程ID
    pthread_mutex_lock(&mutexlock);     // 加锁
    printf(" son os_tid = %d  got lock \n", os_tid);
    sleep(1);
    print_lock("son lock");
    pthread_mutex_unlock(&mutexlock); // 解锁
    return NULL;
}

// 创建线程
void create_thread()
{
    pthread_t t1;
    pthread_create(&t1, NULL, thread_func_lock, NULL);
    pthread_t t2;
    pthread_create(&t2, NULL, thread_func_lock, NULL);
}

int main()
{
    // OS的线程ID
    pid_t os_tid = syscall(SYS_gettid);
    printf(" main os_tid = %d \n", os_tid);

    // 大小
    int size = sizeof(mutexlock);
    printf(" pthread_mutex_t size = %d \n", size);

    // 初始化
    pthread_mutexattr_init(&mutexattr);
    // 设置可重入。
    pthread_mutexattr_settype(&mutexattr, PTHREAD_MUTEX_RECURSIVE_NP);
    pthread_mutex_init(&mutexlock, &mutexattr);
    print_lock("main init");

    // 主线程加锁
    pthread_mutex_lock(&mutexlock);
    print_lock("main lock1");

    create_thread(); // 新建其他线程
    sleep(1);        // 等其他线程加锁，阻塞

    // 主线程加锁
    pthread_mutex_lock(&mutexlock);
    print_lock("main lock2");

    // 主线程解锁
    pthread_mutex_unlock(&mutexlock);
    print_lock("main unlock1");

    // 主线程解锁
    pthread_mutex_unlock(&mutexlock);
    print_lock("main unlock2");

    sleep(5);

    // 销毁。
    pthread_mutex_destroy(&mutexlock);
    pthread_mutexattr_destroy(&mutexattr);
    return 0;
}