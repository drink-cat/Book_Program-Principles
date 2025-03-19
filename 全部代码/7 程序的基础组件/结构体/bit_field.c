#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct MsgHeader
{
    // 多个属性
    uint16_t
        open1 : 1,  // 占用 1位
        close1 : 1, // 占用 1位
        ping2 : 2,  // 占用 2位
        urg4 : 4,   // 占用 4位
        seq8 : 8    // 占用 8位
        ;
};

// 打印 bit 。从低位到高位。
void print_bit(char *title, uint32_t num, int bitCount)
{
    printf("%s = ", title);
    for (int k = 0; k < bitCount; ++k)
    {
        // 取单个 bit
        int bit = (num >> k) & 1;
        printf("%d ", bit);
    }
    printf(" \n");
}

// 变量。
struct MsgHeader header;

int main()
{
    // 大小
    printf("struct size = %d \n", sizeof(struct MsgHeader));

    // 赋值。
    header.open1 = 1U;
    header.close1 = 1U;
    header.ping2 = 2U;
    header.urg4 = 13U;
    header.seq8 = 55U;

    // 查看地址
    printf("struct addr = %p \n", &header);

    // 查看位属性的地址。
    // printf("addr = %p \n", &(header.open1));
    // 报错：error: cannot take address of bit-field ‘open1’

    // 查看属性
    printf("\n");
    uint32_t open_val = header.open1;
    printf("header.open1  = %u \n", open_val);
    uint32_t close_val = header.close1;
    printf("header.close1 = %d \n", close_val);
    uint32_t ping_val = header.ping2;
    printf("header.ping2  = %d \n", ping_val);
    uint32_t urg_val = header.urg4;
    printf("header.urg4   = %d  %#X \n", urg_val, urg_val);
    uint32_t off_val = header.seq8;
    printf("header.seq8   = %d  %#X \n", off_val, off_val);

    // 指针，遍历字节
    uint8_t *ptr = (uint8_t *)(&header);

    // 查看 byte
    printf("\n");
    printf("byte[0] = %#hhX \n", *ptr);
    printf("byte[1] = %#hhX \n", *(ptr + 1));

    // 查看 bit
    printf("\n");
    print_bit("byte[0]", *ptr, 8);
    print_bit("byte[1]", *(ptr + 1), 8);

    return 0;
}