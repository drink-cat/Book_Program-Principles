#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>

// 计算次数
uint64_t calc_count = 0;
// 缓存命中次数
uint64_t cache_hit = 0;
// 结果缓存
uint64_t result_cache[1000];

// 计算数字
uint64_t num_count(int num)
{
    // 边界
    if (num <= 0)
    {
        return 1;
    }

    // 读缓存
    uint64_t tmp = result_cache[num];
    if (tmp > 0)
    {
        cache_hit++;
        return tmp;
    }

    // 计数
    ++calc_count;
    // 结果
    uint64_t ret = num_count(num - 1) + num_count(num - 3) + num_count(num - 5);
    // 写缓存
    result_cache[num] = ret;
    return ret;
}

// 读毫秒
uint64_t now_millis()
{
    struct timeval time;
    gettimeofday(&time, NULL);
    uint64_t millis = time.tv_sec * 1000 + time.tv_usec / 1000;
    return millis;
}

int main()
{
    // 耗时和结果
    uint64_t millis = now_millis();
    uint64_t num_result = num_count(50);
    uint64_t millis_cost = now_millis() - millis;

    printf(" num_result  = %llu \n", num_result);
    printf(" calc_count  = %llu \n", calc_count);
    printf(" cache_hit   = %llu \n", cache_hit);
    printf(" millis_cost = %llu \n", millis_cost);
    return 0;
}