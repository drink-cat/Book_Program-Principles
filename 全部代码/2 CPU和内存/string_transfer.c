#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

// 一个字符串。
char *ptr = "night moon";

// 一个int指针。
int *int_p = NULL;

int main()
{
    // 查看连续的4个字节
    printf("字符串 = %s \n", ptr);
    printf("单个字节 地址 = %p  值 = %#x \n", ptr, (*ptr));
    printf("单个字节 地址 = %p  值 = %#x \n", (ptr + 1), *(ptr + 1));
    printf("单个字节 地址 = %p  值 = %#x \n", (ptr + 2), *(ptr + 2));
    printf("单个字节 地址 = %p  值 = %#x \n", (ptr + 3), *(ptr + 3));

    // char指针转为int指针
    int_p = (int *)ptr;
    printf("int   地址 = %p  值 = %#9x \n", int_p, *int_p);

    return 0;
}