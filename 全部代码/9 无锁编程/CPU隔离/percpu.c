#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sched.h>
#include <stdint.h>
#include <string.h>
#include <pthread.h>

// cpu核的总数
#define cpu_total_count() sysconf(_SC_NPROCESSORS_ONLN)
// 当前的cpu编号
#define cpu_current_no() sched_getcpu()

struct cat_t
{
    uint32_t color;
    uint32_t speed;
};

// 自定义section
__attribute__((section("my_percpu"))) struct cat_t per_cat;
__attribute__((section("my_percpu"))) uint64_t per_load;
uint32_t per_begin; // 记录section的开始地址
uint32_t per_end;   // 记录section的结束地址

int cpu_total;    // cpu核的总数
int section_size; // 自定义section的大小
void *array_ptr;  // 数组

// 生成数组
void build_array()
{
    // 自定义section的大小
    section_size = (uint64_t)&per_end - (uint64_t)&per_begin;
    // 数组大小
    int array_size = section_size * cpu_total;
    // 申请整块内存
    array_ptr = malloc(array_size);
    memset(array_ptr, 0, array_size);
    printf(" cpu_total    = %d \n", cpu_total);
    printf(" section_size = %d \n", section_size);
    printf(" array_ptr    = %p \n\n", array_ptr);
}

// 获得percpu的变量
struct cat_t *get_per_cat()
{
    // 获得当前的CPU编号
    int cpu_curr = cpu_current_no();
    // 找到CPU编号对应的percpu数组元素
    void *array_element = array_ptr + section_size * cpu_curr;
    // 找到变量的地址偏移
    int offset = (uint64_t)&per_cat - (uint64_t)&per_begin;
    // 找到变量的地址
    void *cat_addr = array_element + offset;
    // 获得变量指针
    return (struct cat_t *)cat_addr;
}

// 获得percpu的变量
uint64_t *get_per_load()
{
    // 当前CPU编号
    int cpu_curr = cpu_current_no();
    // 找到CPU编号对应的数组元素
    void *array_element = array_ptr + section_size * cpu_curr;
    // 找到地址偏移
    int offset = (uint64_t)&per_load - (uint64_t)&per_begin;
    // 找到变量地址
    void *count_addr = array_element + offset;
    // 转换类型
    return (uint64_t *)count_addr;
}

// 打印percpu的数组
void print_array()
{
    printf("\n");
    // 遍历每个CPU
    for (int n = 0; n < cpu_total; ++n)
    {
        // 数组元素
        void *array_element = array_ptr + section_size * n;
        // 找到地址偏移
        int offset_cat = (uint64_t)&per_cat - (uint64_t)&per_begin;
        int offset_load = (uint64_t)&per_load - (uint64_t)&per_begin;
        // 找到变量地址
        struct cat_t *cat = (struct cat_t *)(array_element + offset_cat);
        uint64_t *load = (uint64_t *)(array_element + offset_load);
        printf(" CPU = %d  array_element = %p  load = %llu  cat.speed = %u \n",
               n, array_element, *load, cat->speed);
    }
}

// 线程的函数
void *thread_func(void *param)
{
    char *name = (char *)param;
    for (int m = 0; m < 3; ++m)
    {
        // 当前CPU编号
        int cpu_curr = cpu_current_no();
        printf(" %s on CPU = %d .", name, cpu_curr);

        // 增加负载
        uint64_t *load = get_per_load();
        printf(" load = %p .", load);
        ++(*load);

        // 和上一步相同操作，方便对比。
        struct cat_t *cat = get_per_cat();
        printf(" cat = %p \n", cat);
        ++(cat->speed);

        // 手动触发线程调度。可能调度到不同的CPU
        sleep(1);
    }
}

int main()
{
    cpu_total = cpu_total_count();
    // 构建数组
    build_array();

    pthread_t t1;
    pthread_create(&t1, NULL, thread_func, "Thread-1");
    pthread_t t2;
    pthread_create(&t2, NULL, thread_func, "Thread-2");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    print_array();
    free(array_ptr);
    return 0;
}