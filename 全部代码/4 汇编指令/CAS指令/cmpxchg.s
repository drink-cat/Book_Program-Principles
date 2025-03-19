.data

int64_cas :      # 等待cas的变量
    .quad 0x0 

int64_old :     # 输入的旧值
    .quad 0x0

int64_new :     # 输入的新值
    .quad 0x0

str_tip : 
    .string "Please input like : 0 3 \n"

str_input :     # 输入
    .string "%lld %lld"

str_cas_yes :   # 成功
    .string "CAS = yes . current = %lld  rax = %lld  \n"

str_cas_no :    # 失败
    .string "CAS = no  . current = %lld  rax = %lld  \n"

.text 
.global main 

main : 
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp 

    # 提示
    movq $str_tip, %rdi 
    callq printf 

    movq $0, -8(%rbp)   # 记录循环次数

tmp_loop :      # 循环
    cmpq $3, -8(%rbp)   # 判断循环次数
    jge tmp_loop_out    # 退出循环
    incq -8(%rbp)       # 循环次数+1

    movq $str_input, %rdi 
    movq $int64_old, %rsi   # 输入旧值
    movq $int64_new, %rdx   # 输入新值
    callq scanf             # 输入

    movq $int64_cas, %rdi       # 地址
    movq int64_old(%rip), %rsi  # 旧值
    movq int64_new(%rip), %rdx  # 新值
    callq func_cmpxchg          # 执行cas

    jmp tmp_loop    # 继续循环

tmp_loop_out :

    addq $64, %rsp 
    popq %rbp 
    retq 

# ----------------
func_cmpxchg :      # 函数，执行cas操作
    pushq %rbp 
    movq %rsp, %rbp 
    subq $64, %rsp

    movq %rdi, %r8      # 地址
    movq %rsi, %r9      # 旧值
    movq %rdx, %r10     # 新值

    movq %r9, %rax       # 旧值写到rax
    cmpxchgq %r10, (%r8) # 执行cas

    movq %rax, -8(%rbp) # 保存rax

    cmpq %r9, %rax      # 判断 rax == oldValue
    je tmp_yes          # 相等，则cas成功
    jne tmp_no          # 不相等，则cas失败

tmp_yes : 
    movq $str_cas_yes, %rdi 
    jmp tmp_out

tmp_no : 
    movq $str_cas_no, %rdi 
    jmp tmp_out

tmp_out : 
    movq (%r8) , %rsi   # 取当前的值
    movq -8(%rbp), %rdx # 取 rax
    callq printf 

    addq $64, %rsp 
    popq %rbp 
    retq  
