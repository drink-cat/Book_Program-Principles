#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 查看输入、输出
void func_input_output(int32_t in_aa, int64_t in_bb)
{
  int32_t out_cc; // 输出
  int64_t out_dd; // 输出

  asm volatile( // 内联汇编

      "movl %%eax, %%ecx \n" // 把 eax 写到 ecx
      "movq %%rbx, %%rdx \n" // 把 rbx 写到 rdx
      "incl %%ecx \n"        // ecx 加1
      "decq %%rdx \n"        // rdx 减1

      : "=c"(out_cc), // 输出，把 ecx 写到 out_cc
        "=d"(out_dd)  // 输出，把 rdx 写到 out_dd

      : "a"(in_aa), // 输入，把 in_aa 写到 eax
        "b"(in_bb)  // 输入，把 in_bb 写到 rbx

      : "memory" // 提示修改了内存。禁止编译器重排序
  );

  printf("Input  :   aa = %d   bb = %lld \n", in_aa, in_bb);
  printf("Output :   cc = %d   dd = %lld \n", out_cc, out_dd);
}

// 变量。
int32_t aa;
int64_t bb;

int main()
{
  printf("Please input like :  100  200 \n");
  scanf("%d %lld", &aa, &bb);

  func_input_output(aa, bb);

  return 0;
}
