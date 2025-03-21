#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 原始数组
int32_t num_array[2] = {10000, 20000};

// 参数为名称
void add_by_name(int32_t num_array[2])
{
    num_array[0] += 5;
    num_array[1] += 5;
}

// 参数为指针
void add_by_ptr(int32_t *ptr)
{
    *(ptr + 0) += 800;
    *(ptr + 1) += 800;
}

void print_array(char *title, int32_t *ptr)
{
    printf("\n %s \n", title);
    printf(" arr[0] = %d \n", *(ptr + 0));
    printf(" arr[1] = %d \n", *(ptr + 1));
}

int main()
{
    add_by_name(num_array);
    print_array("add_by_name :", num_array);

    add_by_ptr(num_array);
    print_array("add_by_ptr :", num_array);

    return 0;
}
