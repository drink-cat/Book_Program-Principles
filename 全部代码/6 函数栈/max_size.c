#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 只看一个函数
int main()
{
    // 获得变量的地址
    int tmp = 0;
    uint64_t init_addr = (uint64_t)&tmp;
    uint64_t tmp_addr = init_addr;

    // 向下遍历栈地址，直到触发栈溢出
    for (int k = 0; k < 900000; ++k)
    {
        // 地址的差值。
        uint64_t offset = init_addr - tmp_addr;

        // 访问指定的内存。可能触发栈溢出。
        int tmp2 = *((int *)tmp_addr);

        printf("tmp_addr = %#llx  %llu   offset = %llu \n", tmp_addr, tmp_addr, offset);

        // 地址下移。
        tmp_addr = tmp_addr - 1024;
    }

    return 0;
}