int ee = 100;
int ff = 200;

// loadstore
int func_load_store()
{
    int tmp1 = ee;
    ff = 600;
    return tmp1;
}

// 2个指令前后依赖
int func_load_store_depend()
{
    int tmp1 = ee;
    ff = 600 + tmp1; // 指令前后依赖。
    return tmp1;
}

extern void func_empty();

// 2个指令之间调用函数
int func_load_store_func()
{
    int tmp1 = ee;
    func_empty(); // 调用一个方法。
    ff = 600;
    return tmp1;
}

// 使用内存屏障相关的关键字、标识符
int func_load_store_barrier()
{
    int tmp1 = ee;
    asm("" ::: "memory"); // 内存屏障相关
    ff = 600;
    return tmp1;
}

// 使用内存屏障相关的指令
int func_load_store_barrier2()
{
    int tmp1 = ee;
    asm("mfence" ::: "memory"); // 内存屏障相关
    ff = 600;
    return tmp1;
}
