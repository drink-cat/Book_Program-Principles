#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

// 函数的4个部分：函数名、入参、返回值、函数体
float func_sum_num(int age, int *age2)
{
	int sum = age + *age2 + 1;
	float ret = (float)sum;
	return ret;
}

// main 函数
int main()
{
	// 局部变量
	int age = 3;
	int age2 = 5;

	// 调用自定义函数 func_sum_num
	float ret = func_sum_num(age, &age2);

	// 调用库函数 printf
	printf("函数的返回值 = %6.2f \n", ret);

	return 0;
}