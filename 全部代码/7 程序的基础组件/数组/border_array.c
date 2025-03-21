#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 数组
int32_t array[2] = {0xA1A2A3A4, 0xB1B2B3B4};

// 16位整数
int16_t bb16 = 0xC1C2;
int16_t cc16 = 0xD1D2;

// 32位整数
int32_t dd32 = 0xE1E2E3E4;

// 查看变量的信息
void print_param(char *name, uint64_t addr, int size)
{
    printf("%8s    addr = %#X  %llu    size = %d \n", name, addr, addr, size);
}

void print_int32(int32_t num)
{
    printf("  int32 = %13d  %#13X \n", num, num);
}

int main()
{
    print_param("array", (uint64_t)array, sizeof(array));
    print_param("bb16", (uint64_t)&bb16, sizeof(bb16));
    print_param("cc16", (uint64_t)&cc16, sizeof(cc16));
    print_param("dd32", (uint64_t)&dd32, sizeof(dd32));

    // 读数组的元素
    int32_t num0 = array[0];
    int32_t num1 = array[1];

    // 读数组之外的元素
    int32_t num2 = array[2];
    int32_t num3 = array[3];

    printf("\n");
    print_int32(num0);
    print_int32(num1);
    print_int32(num2);
    print_int32(num3);
    return 0;
}
