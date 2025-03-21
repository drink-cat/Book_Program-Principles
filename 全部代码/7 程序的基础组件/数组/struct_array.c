#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct Desk
{
    int32_t length; // 4个字节
    int16_t width;  // 2个字节
};

// 数组
struct Desk desk_arr[3] = {{.length = 5000, .width = 600}};

int main()
{
    printf("struct size = %d \n", sizeof(struct Desk));
    printf("array  size = %d \n", sizeof(desk_arr));

    // 写属性
    desk_arr[2].length = 1000;
    desk_arr[2].width = 200;

    // 读属性
    int32_t length = desk_arr[2].length;
    int16_t width = desk_arr[2].width;
    printf("desk_arr[2].length = %d \n", length);
    printf("desk_arr[2].width  = %d \n", width);

    return 0;
}
