# ----------------------------
.data       # 可读可写数据段

.global num_int64   # 全局的符号

    .align 16    # 对齐
num_int64:  # 单值变量
    .quad 2000  # 一个64位整数

num_int32_array: # 数组变量
    .long 100   # 数组元素
    .long 200   # 数组元素

# ----------------------------
.section .rodata # 只读数据段

str_int64:  # 字符串。打印变量的地址和值
    .string "num_int64 addr = %#llX    value = %lld \n"

str_ret:    # 字符串。打印函数的地址和返回值
    .string "func_add  addr = %#llX   return = %lld \n"

# ----------------------------
.text       # 代码段

.global main        # 全局的符号
.local  func_add    # 本地的符号

# ------------
    .align 1   # 对齐
main:       # 定义main函数
    pushq %rbp          # 入栈。把rbp的值压入栈顶
    movq %rsp, %rbp     # 把rsp的值赋给rbp
    subq $64, %rsp      # 栈帧扩容。

    movq $str_int64, %rdi       # 入参1。绝对寻址
    leaq num_int64(%rip), %rsi  # 入参2。相对寻址
    movq num_int64(%rip), %rdx  # 入参3。相对寻址
    callq printf                # 调用函数

    movq num_int64(%rip), %rdi  # 入参1。相对寻址
    callq func_add              # 调用函数
    movq %rax, -8(%rbp)         # 函数的返回值。

    leaq str_ret(%rip), %rdi    # 入参1。相对寻址
    movq $func_add, %rsi        # 入参2。绝对寻址
    movq -8(%rbp), %rdx         # 入参3。函数的返回值
    callq printf                # 调用函数

    addq $64, %rsp      # 栈帧缩容。
    popq %rbp           # 出栈。把栈顶的值赋给rbp
    retq                # 退出函数

# ------------
    .align 8   # 对齐
func_add:   # 定义函数
    pushq %rbp
    movq %rsp, %rbp 

    movq %rdi, %rcx     # 取入参1
    addq $46, %rcx      # 加法。增加值
    movq %rcx, %rax     # 返回值

    popq %rbp 
    retq 
