#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <syscall.h>
#include "co_handler.h"

#define taskid syscall(SYS_gettid) // 线程ID
#define co_name co_running->name   // 当前协程的名称

// 模拟tcp发送。非阻塞。
void func_tcp_send()
{
    int32_t tmp1 = 1;
    printf(" thread = %d co = %13s  1  at %p \n", taskid, co_name, &tmp1);
    co_yield ();
    int32_t tmp2 = 1;
    printf(" thread = %d co = %13s  2  at %p \n", taskid, co_name, &tmp2);
    co_yield ();
    int32_t tmp3 = 1;
    printf(" thread = %d co = %13s  3  at %p \n", taskid, co_name, &tmp3);
}

// 模拟写文件。非阻塞。
void func_write_file()
{
    int32_t tmp1 = 1;
    printf(" thread = %d co = %13s  1  at %p \n", taskid, co_name, &tmp1);
    co_yield ();
    int32_t tmp2 = 1;
    printf(" thread = %d co = %13s  2  at %p \n", taskid, co_name, &tmp2);
    co_yield ();
    int32_t tmp3 = 1;
    printf(" thread = %d co = %13s  3  at %p \n", taskid, co_name, &tmp3);
}

int main()
{
    int tmp3 = 1;
    printf(" main at %p \n", &tmp3);

    // 子协程。放入队列。
    struct co *co_tcp = co_create("Send_TCP_co", func_tcp_send);
    co_list[0] = co_tcp;
    struct co *co_file = co_create("Write_FILE_co", func_write_file);
    co_list[3] = co_file;

    // 运行协程管理器
    co_handler_run();

    return 0;
}