#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

// 把2个double相加
double sum_double(double aa, double bb)
{
    double cc; // 返回

    asm volatile( // 内联汇编

        "movsd %1, %%xmm6 \n"     // 把 内存1 写到 xmm6
        "movsd %2, %%xmm7 \n"     // 把 内存2 写到 xmm7
        "addsd %%xmm6, %%xmm7 \n" // 把 xmm6 加到 xmm7
        "movsd %%xmm7, %0 \n"     // 把 xmm7 写到 内存0

        : "=m"(cc) // 内存0 。对应返回cc

        : "m"(aa),  // 内存1 。对应参数aa
          "m"(bb)); // 内存2 。对应参数bb

    return cc;
}

int main()
{
    double aa = 3333.33;
    double bb = 22.55;

    // 调用函数
    double cc = sum_double(aa, bb);

    printf(" Param  :  aa = %f   bb = %f \n", aa, bb);
    printf(" Result :  sum = %f \n", cc);

    return 0;
}
