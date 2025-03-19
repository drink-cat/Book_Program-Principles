#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 变量在数据区
int64_t out_tmp5 = 555;
int64_t out_tmp6 = 666;

int main()
{
    // 局部变量。变量在函数栈
    int64_t tmp3 = 333;
    int64_t tmp4 = 444;
    printf("main 的局部变量 : \n");
    printf("  tmp3  addr = %p  value = %lld \n", &tmp3, tmp3);
    printf("  tmp4  addr = %p  value = %lld \n", &tmp4, tmp4);
    printf("\n");

    printf("全局变量 :  \n");
    printf("  out_tmp5  addr = %p  value = %lld \n", &out_tmp5, out_tmp5);
    printf("  out_tmp6  addr = %p  value = %lld \n", &out_tmp6, out_tmp6);
    printf("\n");

    // 休眠进程。便于查看进程的内存布局
    sleep(9999);
    return 0;
}
