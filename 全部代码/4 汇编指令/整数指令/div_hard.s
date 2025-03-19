.data 

str_int32 :
    .string "int32  shang = %#X   yushu = %#X \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 32位。操作寄存器。有符号除法
    movl $0x80556677, %eax  # 被除数，eax。负数 
    cltd                    # 符号扩展 eax > edx:eax 
    movl $1, %r8d           # 除数，r8d
    shll $12, %r8d          # 左移12位
    idivl %r8d              # eax / r8d = eax, edx 
    movq $str_int32, %rdi 
    movl %eax, %esi         # 商
    movl %edx, %edx         # 余数
    callq printf 

    # 32位。操作寄存器。无符号除法
    movl $0x80556677, %eax  # 被除数，eax。
    movl $0, %edx           # 零扩展。edx 置0
    movl $1, %r8d           # 除数，r8d
    shll $12, %r8d          # 移动12位
    divl %r8d               # eax / r8d = eax, edx 
    movq $str_int32, %rdi 
    movl %eax, %esi         # 商
    movl %edx, %edx         # 余数
    callq printf 

    addq $64, %rsp 
    popq %rbp 
    retq 
