
SECTIONS   
{
    . = 0x3000003 ;         /*  重置当前地址  */

    section_ddd_func :      /*  设置section  */
    {
        *(ddd_func);        /*  收集 ddd_func 标记 */
    }

    . = 0x7000006 ;         /*  重置当前地址  */
    . = ALIGN(8) ;          /*  对齐当前地址  */

    section_eee_data :      /*  设置section  */
    {
        eee_data_begin = . ;    /*  设置符号的地址  */
        *(eee_data);            /*  收集 eee_data 标记 */
        eee_data_inner = . ;    /*  设置符号的地址  */
        *(eee_data_2);          /*  收集 eee_data_2 标记 */
        eee_data_end = . ;      /*  设置符号的地址  */
    }

    section_www_data :      /*  设置section  */
    {
        *(www_data);        /*  收集 www_data 标记 */
    }
}
