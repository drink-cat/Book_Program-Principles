
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

char *name = "Jack";

int main()
{
    // 查看完整的值。打印时，先打印大值，符合人的视角。
    printf("字符串  地址 = %p  值 = %s \n", name, name);

    char *ptr = name;
    for (size_t i = 0; i < 4; i++)
    {
        // 取一个字节。
        char *ptrX = (ptr + i);
        char ch = *ptrX;
        printf("当前字节值 = %c   地址 = %p \n", ch, ptrX);
    }

    return 0;
}
