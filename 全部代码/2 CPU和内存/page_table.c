#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 各个部分占用的位数。一共48位。
int bit_offset = 12;
int bit_pte = 9;
int bit_pmd = 9;
int bit_pud = 9;
int bit_pgd = 9;

// 移位的位数。用于计算每一部分的值。
int shift_offset = -1;
int shift_pte = -1;
int shift_pmd = -1;
int shift_pud = -1;
int shift_pgd = -1;

// 掩码。用于计算每一部分的值。
#define _build_mask(off) (1 << off) - 1
int mask_offset = -1;
int mask_pte = -1;
int mask_pmd = -1;
int mask_pud = -1;
int mask_pgd = -1;

// 初始化。
void init_all()
{
    shift_offset = 0;
    shift_pte = shift_offset + bit_offset;
    shift_pmd = shift_pte + bit_pte;
    shift_pud = shift_pmd + bit_pmd;
    shift_pgd = shift_pud + bit_pud;
    mask_offset = _build_mask(bit_offset);
    mask_pte = _build_mask(bit_pte);
    mask_pmd = _build_mask(bit_pmd);
    mask_pud = _build_mask(bit_pud);
    mask_pgd = _build_mask(bit_pgd);
}

// 从虚拟地址取出一个部分。
int fetch_part(unsigned long long virtual_addr, int shift_xx, int mask_xx)
{
    // 移位。让该部分靠右。
    unsigned long long tmp = virtual_addr >> shift_xx;
    // 位与。只保留该部分。
    unsigned long long tmp2 = tmp & mask_xx;
    return (int)tmp2;
}

// 从虚拟地址截取各个部分。
#define fetch_offset(va) fetch_part(va, shift_offset, mask_offset)
#define fetch_pte(va) fetch_part(va, shift_pte, mask_pte)
#define fetch_pmd(va) fetch_part(va, shift_pmd, mask_pmd)
#define fetch_pud(va) fetch_part(va, shift_pud, mask_pud)
#define fetch_pgd(va) fetch_part(va, shift_pgd, mask_pgd)

// 把整数转成2进制。指定多少位。高位在左侧。
void cvt_bin(unsigned long long num, char *buf, int bit_count)
{
    // 高位在左侧。依次取一个bit 。
    char *buf2 = buf;
    for (int count = bit_count - 1; count >= 0; --count)
    {
        // 右移。
        unsigned long long tmp = num >> count;
        // 截取一个bit。
        int bit = (int)(tmp & 1);
        // 保留一个字符
        char ch = (bit == 0) ? '0' : '1';
        *buf2 = ch;
        ++buf2;
    }
    // 字符串的末尾。
    *buf2 = '\0';
}

int main()
{
    init_all();

    printf("\n查看页表的各个部分：\n");
    printf("%10s  %5s  %5s  %6s \n", "PART", "bits", "shift", "mask");
    printf("%10s  %5d  %5d  %#6x \n", "pgd", bit_pgd, shift_pgd, mask_pgd);
    printf("%10s  %5d  %5d  %#6x \n", "pud", bit_pud, shift_pud, mask_pud);
    printf("%10s  %5d  %5d  %#6x \n", "pmd", bit_pmd, shift_pmd, mask_pmd);
    printf("%10s  %5d  %5d  %#6x \n", "pte", bit_pte, shift_pte, mask_pte);
    printf("%10s  %5d  %5d  %#6x \n", "offset", bit_offset, shift_offset, mask_offset);

    // 一个虚拟地址。48位，使用6个字节。
    unsigned long long virtual_addr = 0x12F3F4F5F6F7;
    // 拆分出各个部分
    int part_offset = fetch_offset(virtual_addr);
    int part_pte = fetch_pte(virtual_addr);
    int part_pmd = fetch_pmd(virtual_addr);
    int part_pud = fetch_pud(virtual_addr);
    int part_pgd = fetch_pgd(virtual_addr);
    // 查看各个部分的二进制
    char buf_va[50], buf_offset[13], buf_pte[10], buf_pmd[10], buf_pud[10], buf_pgd[10];
    cvt_bin(virtual_addr, buf_va, 48);
    cvt_bin(part_offset, buf_offset, bit_offset);
    cvt_bin(part_pte, buf_pte, bit_pte);
    cvt_bin(part_pmd, buf_pmd, bit_pmd);
    cvt_bin(part_pud, buf_pud, bit_pud);
    cvt_bin(part_pgd, buf_pgd, bit_pgd);

    // 为了便于查看，把二进制的位对齐。
    printf("\n查看虚拟地址的各个部分：\n");
    printf("virtual_addr  %20llu  %50s \n", virtual_addr, buf_va);
    printf("part_pgd      %20d  %11s \n", part_pgd, buf_pgd);
    printf("part_pud      %20d  %20s \n", part_pud, buf_pud);
    printf("part_pmd      %20d  %29s \n", part_pmd, buf_pmd);
    printf("part_pte      %20d  %38s \n", part_pte, buf_pte);
    printf("part_offset   %20d  %50s \n", part_offset, buf_offset);

    printf("\n\n");
    return 0;
}
