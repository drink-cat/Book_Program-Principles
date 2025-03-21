.text 
.global co_switch_context 

# 切换协程的上下文
co_switch_context :

    # 备份上下文到 from_co 
    movq %rsp, 0(%rdi)  # 寄存器，rsp
    movq %rbp, 8(%rdi)  # 寄存器，rbp
    movq %rax, 16(%rdi) # 寄存器，rax
    movq %rbx, 24(%rdi) # 寄存器，rbx
    movq %rcx, 32(%rdi) # 寄存器，rcx
    movq %rdx, 40(%rdi) # 寄存器，rdx

    # 从 to_co 恢复上下文
    movq 0(%rsi), %rsp  # 寄存器，rsp
    movq 8(%rsi), %rbp  # 寄存器，rbp
    movq 16(%rsi), %rax # 寄存器，rax
    movq 24(%rsi), %rbx # 寄存器，rbx
    movq 32(%rsi), %rcx # 寄存器，rcx
    movq 40(%rsi), %rdx # 寄存器，rdx

    retq 
    