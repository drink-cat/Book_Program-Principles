#ifndef _CO_HANDLER_H_
#define _CO_HANDLER_H_

#define CO_STACK_SIZE 4096 // 协程栈的大小
#define CO_LIST_SIZE 9     // 协程队列的大小
#define CO_STATUS_OK 1     // 协程的状态。正常。
#define CO_STATUS_EXIT 2   // 协程的状态。退出。

// 协程的对象
struct co
{
    uint64_t rsp;    // +0  寄存器，rsp
    uint64_t rbp;    // +8  寄存器，rbp
    uint64_t rax;    // +16 寄存器，rax
    uint64_t rbx;    // +24 寄存器，rbx
    uint64_t rcx;    // +32 寄存器，rcx
    uint64_t rdx;    // +40 寄存器，rdx
    char *stack_low; // 栈的下界地址
    char name[30];   // 名称
    uint32_t status; // 状态
};

typedef void (*co_func)(); // 协程的函数

struct co *co_main;    // 主协程。负责调度子协程
struct co *co_running; // 正在运行的子协程

// 限于篇幅，队列使用数组实现。使用链表更合适。
struct co *co_list[CO_LIST_SIZE]; // 协程队列
uint32_t co_list_cursor;          // 轮询数组的下标。

// 创建协程
extern struct co *co_create(char *name, co_func func);

// 运行某个子协程。主协程调用此方法。
extern void co_resume(struct co *co_sub);

// 当前协程切换出去。子协程调用此方法。
extern void co_yield ();

// 运行协程管理器
extern void co_handler_run();

#endif
