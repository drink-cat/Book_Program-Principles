
.data 

float64 : 
    .double 888.66

float32 : 
    .float 333.3

tmp32 : 
    .float -3

str_64 : 
    .string " float64 = %.5f  \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 除法。64位
    movsd float64(%rip), %xmm0  # 64位，浮点数，xmm0
    movq $-20, %r9               # 64位，整数，r9
    cvtsi2sd %r9, %xmm7         # 64位，整数转浮点数
    divsd %xmm7, %xmm0          # xmm0 = xmm0 / xmm7 
    movq $str_64, %rdi 
    callq printf 

    # 除法。32位
    movss float32(%rip), %xmm0  # 32位，浮点数，xmm0
    divss tmp32(%rip), %xmm0    # xmm0 = xmm0 / tmp32 
    movq $str_64, %rdi 
    cvtss2sd %xmm0, %xmm0       # 32位浮点数转64位浮点数
    callq printf 

    popq %rbp 
    retq 
