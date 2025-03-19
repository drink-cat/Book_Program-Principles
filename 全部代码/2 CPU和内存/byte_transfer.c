#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

// 内存中连续的多个字节。
char chars[] = {0x05, 0x06, 0x07, 0x08};

// 设为全局变量，方便查看符号。
char *char_p = NULL;
short *short_p = NULL;
int *int_p = NULL;

int main()
{
    // 用首地址，转为多种数字。
    char_p = (char *)chars;
    short_p = (short *)chars;
    int_p = (int *)chars;

    printf("字节数组的地址 = %p \n", &chars);
    printf("char  地址 = %p  值 = %#9x \n", char_p, *char_p);
    printf("short 地址 = %p  值 = %#9x \n", short_p, *short_p);
    printf("int   地址 = %p  值 = %#9x \n", int_p, *int_p);
}
