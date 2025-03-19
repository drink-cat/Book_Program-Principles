#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

// int 占用4个字节。
int value_int = 0x01020304;

int main()
{
    // 查看完整的值。打印时，先打印大值，符合人的视角。
    printf("int变量  地址 = %p  16进制值 = %#x  10进制值 = %d \n",
           &value_int, value_int, value_int);

    // 取变量的地址。用char解析每个字节。
    char *ptr = (char *)&value_int;

    // 从左往右，遍历内存地址。  int 占用4个字节。
    for (size_t i = 0; i < 4; i++)
    {
        // 取一个字节。
        char *ptrX = (ptr + i);
        char ch = *ptrX;
        printf("当前字节值 = %#x   地址 = %p \n", ch, ptrX);
    }
}
