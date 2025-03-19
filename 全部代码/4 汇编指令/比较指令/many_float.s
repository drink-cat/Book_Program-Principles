.data 

int64 : 
    .quad 333 

int32 : 
    .long 222 

float64 : 
    .double 333.33 

float32 : 
    .float 222.22 

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 比较浮点数。64位 
    ucomisd %xmm1, %xmm2          # 比较寄存器与寄存器
    ucomisd float64(%rip), %xmm2  # 比较寄存器与变量
    ucomisd -8(%rbp), %xmm2       # 比较寄存器与栈内存

    # 比较浮点数。32位 
    ucomiss %xmm1, %xmm2          # 比较寄存器与寄存器
    ucomiss float32(%rip), %xmm2  # 比较寄存器与变量
    ucomiss -4(%rbp), %xmm2       # 比较寄存器与栈内存

    addq $64, %rsp 
    popq %rbp 
    retq 
