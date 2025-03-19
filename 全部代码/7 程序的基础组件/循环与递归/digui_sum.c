#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// 原始数组
int nums[6] = {10, 30, 50, 90, 20, 0};

// 找到的3个数字
int pick[3];

// 递归查找满足求和条件的数字
void find_sum(int nums_index, int pick_index)
{
    // 如果已经找到3个元素了，就判断是否满足条件。
    if (pick_index == 3)
    {
        // 累加
        int sum = pick[0] + pick[1] + pick[2];
        if (sum == 100)
        {
            printf(" found : %d %d %d \n", pick[0], pick[1], pick[2]);
        }
        return;
    }
    // 判断边界条件
    if (pick_index > 3)
    {
        return;
    }
    // 判断边界条件
    if (nums_index >= 6)
    {
        return;
    }

    // 使用当前元素。读取元素，找下一个元素。
    pick[pick_index] = nums[nums_index];
    find_sum(nums_index + 1, pick_index + 1);

    // 不使用当前元素。继续看下一个元素。
    find_sum(nums_index + 1, pick_index);
}

int main()
{
    printf(" find 3 nums that can sum to 100 \n");
    find_sum(0, 0);
    return 0;
}