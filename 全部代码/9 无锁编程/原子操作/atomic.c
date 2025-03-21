#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <pthread.h>

// 线程安全的CAS
bool func_cas(int32_t *param_addr, int32_t old_value, int32_t new_value)
{
    int32_t ret_eax = 0;             // 记录返回的eax
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

// 加值
void atomic_add(int32_t *num, int32_t add)
{
    while (true)
    {
        // 取出旧值。CAS更新。
        int32_t old_value = *num;
        int32_t new_value = old_value + 1;
        bool ok = func_cas(num, old_value, new_value);
        if (ok)
        {
            return;
        }
    }
}

// 加1
void atomic_incr(int32_t *num, int32_t add)
{
    atomic_add(num, 1);
}

// 返回旧值。然后加值
int32_t atomic_get_and_add(int32_t *num, int32_t add)
{
    while (true)
    {
        // 取出旧值。CAS更新。
        int32_t old_value = *num;
        int32_t new_value = old_value + add;
        bool ok = func_cas(num, old_value, new_value);
        if (ok)
        {
            return old_value;
        }
    }
}

// 返回旧值。然后加1
int32_t atomic_get_and_incr(int32_t *num)
{
    return atomic_get_and_add(num, 1);
}

// 返回旧值。然后减值
int32_t atomic_get_and_sub(int32_t *num, int32_t sub)
{
    return atomic_get_and_add(num, -sub);
}

// 返回旧值。然后减1
int32_t atomic_get_and_decr(int32_t *num)
{
    atomic_get_and_sub(num, 1);
}

// 整数变量。
int32_t count = 0;

// 线程函数
void *thread_func(void *param)
{
    for (int e = 0; e < 300000; ++e)
    {
        // 原子操作
        int32_t old1 = atomic_get_and_add(&count, 3);
        int32_t old2 = atomic_get_and_sub(&count, 1);
    }
    return NULL;
}

int main()
{
    printf(" count before = %d \n", count);

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
    printf(" count after  = %d \n", count);
    return 0;
}