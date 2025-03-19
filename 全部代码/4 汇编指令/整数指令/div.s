.data 

str_int32 :
    .string "int32   shang = %d   yushu = %d \n"

str_int64 :
    .string "int64   shang = %lld   yushu = %lld \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 64位。操作寄存器。有符号除法
    movq $17, %rax      # 被除数，rax
    cqto                # 符号扩展 rax > rdx:rax 
    movq $-3, %r8       # 除数，r8
    idivq %r8           # rax / r8 = rax, rdx 
    movq $str_int64, %rdi 
    movq %rax, %rsi     # 商
    movq %rdx, %rdx     # 余数
    callq printf 

    # 64位。操作寄存器。无符号除法
    movq $17, %rax      # 被除数，rax
    movq $0, %rdx       # 零扩展，rdx，清零
    movq $3, %r8        # 除数，r8
    divq %r8            # rax / r8 = rax, rdx 
    movq $str_int64, %rdi 
    movq %rax, %rsi     # 商
    movq %rdx, %rdx     # 余数
    callq printf 

    # 32位。操作寄存器。
    movl $9, %eax       # 被除数，eax
    cltd                # 符号扩展 eax > edx:eax 
    movl $-2, %r8d      # 除数，r8d
    idivl %r8d          # eax / r8d = eax, edx 
    movq $str_int32, %rdi 
    movl %eax, %esi     # 商
    movl %edx, %edx     # 余数
    callq printf 

    # 32位。操作栈。
    movl $-17, %eax     # 被除数，eax
    cltd                # 符号扩展 eax > edx:eax 
    movl $3, -4(%rbp)   # 除数，-4(%rbp)
    idivl -4(%rbp)      # eax / (-4(%rbp)) = eax, edx 
    movq $str_int32, %rdi 
    movl %eax, %esi     # 商
    movl %edx, %edx     # 余数
    callq printf 

    # 16位。操作寄存器。
    movl $0xFFFFFFFF, %eax  # 占位，eax
    movw $13, %ax           # 被除数，ax
    movswl %ax, %eax        # 符号扩展，32位
    cltd                    # 符号扩展 eax > edx:eax 
    movw $-5, %r8w          # 除数，r8w
    idivw %r8w              # eax / r8d = eax, edx 
    movswl %ax, %eax        # 商
    movswl %dx, %edx        # 余数
    movq $str_int32, %rdi 
    movl %eax, %esi 
    movl %edx, %edx 
    callq printf 

    # 8位。操作寄存器。
    movb $-16, %al      # 被除数，al 
    movsbl %al, %eax    # 符号扩展，32位 
    movb $5, %cl        # 除数，cl 
    idivb %cl           # al / cl = al , ah 
    movb %ah, %bl       # 余数  
    movsbl %al, %eax    # 商 
    movsbl %bl, %ebx 
    movq $str_int32, %rdi 
    movl %eax, %esi 
    movl %ebx, %edx 
    callq printf 

    addq $64, %rsp 
    popq %rbp 
    retq 
