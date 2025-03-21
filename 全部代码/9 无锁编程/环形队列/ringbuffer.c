#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <syscall.h>
#include <stdbool.h>

// 消息数组的大小。
#define msg_array_size 4

// 环形队列
struct ring_buffer
{
    volatile uint64_t produce_seq;         // 生产的序号
    volatile uint64_t produce_ready_seq;   // 生产就绪的序号
    volatile uint64_t consume_seq;         // 消费的序号
    struct msg *msg_array[msg_array_size]; // 数组。元素是指针。
};

// 一个消息
struct msg
{
    char name[30];
    int index;
};

struct ring_buffer buffer = {
    .produce_seq = 0, .produce_ready_seq = 0, .consume_seq = 0};

// 生产者。创建1个消息
void func_produce_msg()
{
    // 线程ID
    pid_t taskid = syscall(SYS_gettid);
    while (true)
    {
        // 如果生产速度超过消费速度，需要等待消息被消费
        if (buffer.produce_seq >= (buffer.consume_seq + msg_array_size))
        {
            continue;
        }

        // 获得下一个生产的序号
        buffer.produce_seq++;
        uint64_t next_seq = buffer.produce_seq;

        // 创建一个消息。放入数组。
        struct msg *msg = malloc(sizeof(struct msg));
        int index = next_seq % msg_array_size;
        sprintf(msg->name, "Msg-%d-%llu", taskid, next_seq);
        msg->index = index;
        buffer.msg_array[index] = msg;

        // 标识产生了新的消息
        printf(" thread = %d Produce seq = %llu msg = %s \n",
               taskid, next_seq, msg->name);
        buffer.produce_ready_seq = next_seq;

        // 控制速率。方便测试多种场景。
        // sleep(2);
    }
}

// 消费者。消费1个消息
void func_consume_msg()
{
    // 线程ID
    pid_t taskid = syscall(SYS_gettid);

    while (true)
    {
        // 检查是否有新的消息
        uint64_t ready_seq = buffer.produce_ready_seq;
        uint64_t consume_seq = buffer.consume_seq;
        // 如果没有新的消息，就继续检查
        if (consume_seq >= ready_seq)
        {
            continue;
        }
        // 有新消息，尝试获得这个消息
        bool pick_ok = __sync_bool_compare_and_swap(
            &buffer.consume_seq, consume_seq, consume_seq + 1);
        // 如果竞争失败，就继续检查
        if (!pick_ok)
        {
            continue;
        }
        // 当前线程，竞争到这个消息。消费这个消息
        uint64_t now_seq = consume_seq + 1;
        int index = now_seq % msg_array_size;
        struct msg *msg = buffer.msg_array[index];
        buffer.msg_array[index] = NULL;
        printf(" thread = %d Consume seq = %llu msg = %s \n",
               taskid, now_seq, msg->name);
        free(msg);

        // 控制速率。方便测试多种场景。
        sleep(2);
    }
}

int main()
{
    // 进程ID
    pid_t pid = syscall(SYS_getpid);
    printf(" process = %d \n", pid);

    // 单个生产者
    pthread_t thread_producer1;
    pthread_create(&thread_producer1, NULL, func_produce_msg, NULL);

    // 多个消费者
    pthread_t thread_consumer1;
    pthread_create(&thread_consumer1, NULL, func_consume_msg, NULL);
    pthread_t thread_consumer2;
    pthread_create(&thread_consumer2, NULL, func_consume_msg, NULL);

    sleep(80000);
    return 0;
}