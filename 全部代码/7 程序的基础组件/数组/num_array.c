#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 32位整数的数组
int32_t int32_arr[3] = {100, 200};

// 64位整数的数组
int64_t int64_arr[3] = {555L, 666L};

int main()
{
    // 大小
    printf("int32_arr  size = %d \n", sizeof(int32_arr));
    printf("int64_arr  size = %d \n", sizeof(int64_arr));

    // 写属性
    int32_arr[0] = 101;
    int32_arr[1] = 202;
    int32_arr[2] = 303;
    int64_arr[0] = 555000L;
    int64_arr[1] = 666000L;
    int64_arr[2] = 777000L;

    // 读属性
    int32_t int32_tmp = int32_arr[2];
    int64_t int64_tmp = int64_arr[2];
    printf("int32_arr[2]    value = %d \n", int32_tmp);
    printf("int64_arr[2]    value = %lld \n", int64_tmp);

    // 读写使用指针。
    int32_t *int32_ptr = int32_arr;
    int64_t *int64_ptr = int64_arr;
    *(int32_ptr + 1) = 222;
    *(int64_ptr + 1) = 666111L;
    int32_t int32_tmp2 = *(int32_ptr + 1);
    int64_t int64_tmp2 = *(int64_ptr + 1);
    printf("*(int32_ptr + 1)    value = %d \n", int32_tmp2);
    printf("*(int64_ptr + 1)    value = %lld \n", int64_tmp2);

    return 0;
}
