#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// 普通整数变量
int num_aa = 1;
int num_bb = 2;
int num_cc = 3;

// 查看顺序
void func_order()
{
    // 修改 bb
    num_bb = num_aa;
    // 修改 cc
    num_cc = 5;
}

// 循环的标记
int loop_mark = 1;
// 循环的次数
long long loop_count = 0;

// 查看循环
void func_loop()
{
    // 判断标记。如果标记为0，则退出循环。
    while (loop_mark)
    {
        loop_count++;
        // 累加到很大的数字，就退出。
        if (loop_count > 9000000000000)
        {
            break;
        }
    }
}

// 线程的函数
void *thread_func_lock(void *param)
{
    // 休眠一会
    sleep(1);
    // 关闭循环
    loop_mark = 0;
    printf(" thread change loop_mark to %d \n", loop_mark);
}

int main()
{
    // 查看顺序
    func_order();
    printf(" num  bb = %d  cc = %d \n", num_bb, num_cc);

    // 新建一个线程，修改循环标记
    pthread_t pid;
    pthread_create(&pid, NULL, thread_func_lock, NULL);

    // 查看循环
    func_loop();
    printf(" loop  count = %lld \n", loop_count);
    return 0;
}
