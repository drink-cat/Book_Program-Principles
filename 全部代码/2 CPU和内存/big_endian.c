#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

// int转byte。大端模式。
void int_to_byte_big_endian(int tmp, char *byte_p)
{
    // 从小到大，取出int的4个字节对应的值。
    char ch1 = (char)((tmp >> 0) & 0xFF);
    char ch2 = (char)((tmp >> 8) & 0xFF);
    char ch3 = (char)((tmp >> 16) & 0xFF);
    char ch4 = (char)((tmp >> 24) & 0xFF);

    // 依次给4个字节赋值。
    // 大端。大值在左侧。
    *(byte_p + 0) = ch4;
    *(byte_p + 1) = ch3;
    *(byte_p + 2) = ch2;
    *(byte_p + 3) = ch1;

    printf("int转byte，大端模式： \n");
    printf("int 值 = %#x \n", tmp);
    printf("byte 依次为 %#x  %#x  %#x  %#x \n", *(byte_p + 0),
           *(byte_p + 1), *(byte_p + 2), *(byte_p + 3));
    printf("\n");
}

// byte转int。大端模式。
int byte_to_int_big_endian(char *byte_p)
{
    // 依次读取4个字节的值。
    char byte1 = *(byte_p + 0);
    char byte2 = *(byte_p + 1);
    char byte3 = *(byte_p + 2);
    char byte4 = *(byte_p + 3);

    // 大端。 大值在左侧。
    // 用4个字节，组装一个int 。
    int tmp = 0;
    tmp += ((int)byte1) << 24;
    tmp += ((int)byte2) << 16;
    tmp += ((int)byte3) << 8;
    tmp += ((int)byte4) << 0;

    printf("byte转int，大端模式： \n");
    printf("byte 依次为 %#x  %#x  %#x  %#x \n", byte1, byte2, byte3, byte4);
    printf("int 值 = %#x \n", tmp);
    printf("\n");
}

// int 变量，占用4个字节
int int_param = 0x1A1B1C1D;

// 4个连续的字节
char byte_buf[4];

int main()
{
    // int转byte。大端模式。
    int_to_byte_big_endian(int_param, byte_buf);

    // 重置4个字节。
    byte_buf[0] = 0x61;
    byte_buf[1] = 0x62;
    byte_buf[2] = 0x63;
    byte_buf[3] = 0x64;

    // byte转int。大端模式。
    byte_to_int_big_endian(byte_buf);
}