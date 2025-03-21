#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// 给一个初始值，使得在汇编文件看到定义
pthread_spinlock_t spinlock_aa = 3333;

int main()
{
    int spin_size = sizeof(spinlock_aa);
    printf(" spinlock size = %d \n", spin_size);

    pthread_spin_init(&spinlock_aa, PTHREAD_PROCESS_PRIVATE);
    printf(" after init . value = %d \n", spinlock_aa);

    pthread_spin_trylock(&spinlock_aa);
    printf(" after trylock . value = %d \n", spinlock_aa);

    pthread_spin_unlock(&spinlock_aa);
    printf(" after unlock . value = %d \n", spinlock_aa);

    return 0;
}