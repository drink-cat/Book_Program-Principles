
SECTIONS {
    section_my_percpu :  /* 自定义section */
    {
        per_begin = . ;  /* 开始地址 */
        *(my_percpu) ;   /* 收集符号 */
        per_end = . ;    /* 结束地址 */
    }
}
