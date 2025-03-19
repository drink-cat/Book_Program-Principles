
.data 

float64 : 
    .double 111.11

float32 : 
    .float 333.22

tmp32 : 
    .float 200

str_64 : 
    .string " float64 = %.5f  \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 乘法。64位
    movsd float64(%rip), %xmm0  # 64位，浮点数，xmm0
    movq $-5, %r9               # 64位，整数，r9
    cvtsi2sd %r9, %xmm7         # 64位，整数转浮点数
    mulsd %xmm7, %xmm0          # xmm0 = xmm0 * xmm7 
    movq $str_64, %rdi 
    callq printf 

    # 乘法。32位
    movss float32(%rip), %xmm0  # 32位，浮点数，xmm0
    mulss tmp32(%rip), %xmm0    # xmm0 = xmm0 * tmp32
    movq $str_64, %rdi 
    cvtss2sd %xmm0, %xmm0       # 32位浮点数转64位浮点数
    callq printf 

    popq %rbp 
    retq 
