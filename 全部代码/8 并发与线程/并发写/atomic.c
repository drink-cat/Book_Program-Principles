#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
// #include <atomic.h> // 错误。没有文件。
// #include <stdatomic.h> // 错误。没有文件。

int eee = 111;

int lock = 0;

int exg = 777;

// 加锁
void func_spin_lock(int *lock)
{
    // 循环
    while (true)
    {
        // 尝试CAS
        bool ret = __sync_bool_compare_and_swap(lock, 0, 1);
        // 成功就退出
        if (ret)
        {
            return;
        }
    }
}

int main()
{
    // __atomic int ret = atomic_compare_exchange_weak_acquire(&eee, 111, 222); // 找不到函数。
    // printf("after op . ret = %d  eee = %d \n", ret, eee);

    int expected111 = 111;

    // 内建函数  lock cmpxchgl	%ecx, eee(%rip)
    bool ret = __atomic_compare_exchange_n(
        &eee, &expected111, 222, false, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
    printf("after op . ret = %d  eee = %d \n", ret, eee);

    bool ret2 = __atomic_compare_exchange_n(
        &eee, &expected111, 333, false, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
    printf("after op . ret2 = %d  eee = %d \n", ret2, eee);

    //
    func_spin_lock(&lock);
    printf("after op . lock = %d \n", lock);

    // lock cmpxchgl	%ecx, eee(%rip)
    bool ret3 = __sync_bool_compare_and_swap(&lock, 1, 333);
    printf("after op . ret3 = %d  lock = %d \n", ret3, lock);
    // after op . ret3 = 1  lock = 333

    bool ret4 = __sync_bool_compare_and_swap(&lock, 555, 666);
    printf("after op . ret4 = %d  lock = %d \n", ret4, lock);
    // after op . ret4 = 0  lock = 333

    // 报错。没有这个函数。
    // int retOld = atomic_exchange_acquire(&exg, 777, 999);
    int retOld = __atomic_exchange_n(&exg, 999, __ATOMIC_ACQUIRE);
    // xchgl	exg(%rip), %eax
    printf("after exchange . retOld = %d  exg = %d \n", retOld, exg);
    // after exchange . retOld = 777  exg = 999

    return 0;
}