#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h> // mmap
#include <fcntl.h>
#include <string.h>
#include <errno.h>

// 全局变量。在程序的数据区
char cat_name[8] = {'J', 'a', 'c', 'k', '\0'};

// 全局变量。在程序的数据区
int cat_age = 5;

// 函数。在程序的代码区
void cat_run()
{
    // 栈内变量。 在栈区
    int tmp = 666;
    printf("cat is running . stack param addr = %p \n", &tmp);
}

// 函数。在程序的代码区
int main()
{
    // 调用函数
    cat_run();
    // 栈内变量。 在栈区
    int day1 = 6;
    // 栈内变量。 在栈区
    int day2 = 7;
    // malloc函数分配的内存。在heap区、mmap区。
    void *malloc_ptr = malloc(666);
    // mmap函数分配的内存。在mmap区。
    void *mmap_ptr = mmap(NULL, 500, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);

    // printf("error %d %s \n", errno, strerror(errno));

    // 函数。在程序的代码区
    printf("函数 cat_run 的地址  =  %p \n", &cat_run);
    printf("函数 main 的地址     =  %p \n", &main);

    // 全局变量。在程序的数据区
    printf("全局变量 cat_name 的地址  =  %p \n", &cat_name);
    printf("全局变量 cat_age 的地址   =  %p \n", &cat_age);

    // malloc函数分配的内存。在heap区、mmap区。
    printf("malloc 分配内存的地址  =  %p \n", malloc_ptr);

    // mmap函数分配的内存。在mmap区。
    printf("mmap 分配内存的地址    =  %p \n", mmap_ptr);

    // 栈内变量。 在栈区
    printf("栈内变量 day1 的地址  =  %p \n", &day1);
    printf("栈内变量 day2 的地址  =  %p \n", &day2);

    // 暂停进程。方便查看内存布局。
    sleep(90000);
    return 0;
}