#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "co_handler.h"

// 协程切换上下文。汇编代码
extern void co_switch_context(struct co *from_co, struct co *to_co);

// 协程，执行完了，清理自身
void co_clean_self()
{
    printf("\n ## clean ##  %s  \n", co_running->name);
    co_running->status = CO_STATUS_EXIT; // 退出状态
    co_yield ();                         // 切换到主协程
}

// 创建协程
struct co *co_create(char *name, co_func func)
{
    // 申请协程对象
    struct co *co_new = malloc(sizeof(struct co));
    memset(co_new, 0, sizeof(struct co));
    strcpy(co_new->name, name);
    co_new->status = CO_STATUS_OK;

    // 没有协程函数，直接返回。表示主协程
    if (NULL == func)
    {
        return co_new;
    }

    // 申请协程栈
    co_new->stack_low = malloc(CO_STACK_SIZE);
    // 栈的上界
    uint64_t *tmp_addr = (uint64_t *)(co_new->stack_low + CO_STACK_SIZE);
    uint64_t tmp_up = (uint64_t)tmp_addr;

    // 把清理函数，压入栈顶。
    --tmp_addr;
    *tmp_addr = (uint64_t)co_clean_self;
    // 记录rbp
    co_new->rbp = (uint64_t)tmp_addr;

    // 把协程函数，压入栈顶。
    --tmp_addr;
    *tmp_addr = (uint64_t)func;

    // 记录rsp
    co_new->rsp = (uint64_t)tmp_addr;
    printf(" ## create ##  %13s  stack = %#llX ~ %#llX \n",
           name, (uint64_t)co_new->stack_low, tmp_up);
    return co_new;
}

// 协程切换。
void co_switch(struct co *from_co, struct co *to_co)
{
    // 更新正在运行的协程。
    // 放在切换上下文之前，因为切换后，协程栈上的rip可能导致跳转到其他地方。
    co_running = to_co;

    // 协程切换上下文
    co_switch_context(from_co, to_co);
}

// 运行某个子协程。主协程调用此方法。
void co_resume(struct co *co_sub)
{
    printf("\n ## resume ##   %s \n", co_sub->name);
    co_switch(co_main, co_sub);
}

// 当前协程切换出去。子协程调用此方法。
void co_yield ()
{
    co_switch(co_running, co_main);
}

// 清理协程
void co_delete(struct co *co)
{
    if (co->stack_low != NULL)
    {
        free(co->stack_low);
    }
    free(co);
}

// 从队列找到一个子协程。没有就返回NULL
struct co *co_pick_from_list()
{
    // 找一圈，如果没有就退出。
    for (uint32_t m = 1; m <= CO_LIST_SIZE; ++m)
    {
        // 使用下标轮询。
        ++co_list_cursor;
        if (co_list_cursor >= CO_LIST_SIZE)
        {
            co_list_cursor = 0;
        }
        // 取一个。
        struct co *tmp = co_list[co_list_cursor];
        if (NULL == tmp)
        {
            continue;
        }
        // 协程退出了。
        if (tmp->status == CO_STATUS_EXIT)
        {
            // 清理这个协程。
            co_delete(tmp);
            co_list[co_list_cursor] = NULL;
            continue;
        }
        // 使用这个协程
        return tmp;
    }
    return NULL;
}

// 运行协程管理器
void co_handler_run()
{
    // 主协程
    co_main = co_create("main_co", NULL);

    // 从队列中挑选协程去运行
    co_list_cursor = 0;
    while (1)
    {
        // 从队列中找一个协程。
        struct co *one = co_pick_from_list();
        if (NULL == one)
        {
            break;
        }

        // 运行协程
        co_resume(one);
    }

    // 清理主协程
    co_delete(co_main);
    printf("\n === co handler end === \n\n");
}