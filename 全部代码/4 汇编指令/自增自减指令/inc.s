.data

int64 : .quad 7000
int32 : .long 6000

str64 : .string " int64 =  %lld \n"
str64X : .string " int64 =  %#llX \n"
str32 : .string " int32 =  %d \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 

    # 64位，操作寄存器
    movq $8000, %rbx 
    incq %rbx           # 64位。
    movq $str64, %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 32位，操作寄存器
    movq $0x2222222255555555, %rbx # 64位。占位
    incl %ebx           # 32位。触发高位清0
    movq $str64X, %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 16位，操作寄存器
    movq $0x22222222FFFFFFFF, %rbx # 64位。占位
    incw %bx            # 16位
    movq $str64X, %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 8位，操作寄存器
    movq $0x22222222FFFFFFFF, %rbx # 64位。占位
    incb %bl            # 8位
    movq $str64X, %rdi 
    movq %rbx, %rsi 
    callq printf 

    # 64位，操作内存
    incq int64(%rip)   # 64位
    movq $str64, %rdi 
    movq int64(%rip), %rsi 
    callq printf 

    # 32位，操作内存
    incl int32(%rip)   # 32位
    movq $str32, %rdi 
    movl int32(%rip), %esi 
    callq printf 

    popq %rbp 
    retq 
