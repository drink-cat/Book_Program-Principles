#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <pthread.h>

// 线程安全的CAS
bool func_cas(int *param_addr, int old_value, int new_value)
{
    int ret_eax = 0;                 // 记录返回的eax
    asm volatile(                    // 内联汇编
        "lock \n"                    // 加锁。锁定缓存行
        "cmpxchgl %%ebx, (%%rcx) \n" // 执行 cas
        : "=a"(ret_eax)              // 返回值，eax，写到ret_eax
        : "a"(old_value),            // 旧值，写到rax
          "b"(new_value),            // 新值，写到rcx
          "c"(param_addr));          // 地址，写到rdx

    if (ret_eax == old_value) // cas成功
    {
        return true;
    }
    else // cas失败
    {
        return false;
    }
}

// 线程安全的INC
void func_inc_int(int *addr)
{
    while (true) // 循环，直到操作成功
    {
        int old_v = *addr;                          // 旧值
        int new_v = old_v + 1;                      // 新值
        bool cas_ok = func_cas(addr, old_v, new_v); // 执行cas

        if (cas_ok) // cas成功，就退出
        {
            break;
        }
        else // cas失败，就继续
        {
            continue;
        }
    }
}

// 变量。累加。
int count = 0;

// 是否使用cas
int use_cas = 0;

// 线程的函数
void *thread_func_lock(void *param)
{
    // 执行很多次
    for (int k = 1; k <= 10000; ++k)
    {
        if (use_cas) // 使用cas
        {
            func_inc_int(&count);
        }
        else // 不使用cas
        {
            ++count; // 直接累加
        }
    }
}

int main()
{
    printf("Please choose use CAS or not : 0 = NoCAS  1 = YesCAS \n");
    scanf("%d", &use_cas); // 开关。是否使用cas

    int before = count; // 之前的值

    // 创建多个线程，并发执行
    pthread_t p1;
    pthread_create(&p1, NULL, thread_func_lock, NULL);
    pthread_t p2;
    pthread_create(&p2, NULL, thread_func_lock, NULL);
    pthread_t p3;
    pthread_create(&p3, NULL, thread_func_lock, NULL);
    pthread_t p4;
    pthread_create(&p4, NULL, thread_func_lock, NULL);
    pthread_t p5;
    pthread_create(&p5, NULL, thread_func_lock, NULL);

    sleep(2); // 等待线程完成。

    int after = count; // 之后的值
    printf("count  before = %d  after = %d \n\n", before, after);

    return 0;
}
