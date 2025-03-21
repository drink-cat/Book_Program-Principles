#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdint.h>
#include <syscall.h>
#include <sched.h>
#include <fcntl.h>
#include <string.h>

#define tid syscall(SYS_gettid) // 线程ID

int buf_size = 50;  // 缓存大小
int file_off1 = 0;  // 文件偏移
int file_off2 = 50; // 文件偏移

void *thread_func(void *param)
{
    int taskid = tid;
    char *path = "./io_file.txt";
    int fd = open(path, O_RDWR | O_CREAT, 0666);
    printf(" thread = %d  file = %s  fd = %d \n", taskid, path, fd);

    // 文件偏移
    int *off_ptr = (int *)param;
    int off = *off_ptr;

    // 循环
    uint64_t num = 0;
    char buf[buf_size];
    while (1)
    {
        lseek(fd, off, SEEK_SET); // 文件偏移
        read(fd, buf, buf_size);  // 读文件

        memset(buf, ' ', buf_size);
        sprintf(buf, "\n thread = %d  loop = %llu \n\n", taskid, num);

        lseek(fd, off, SEEK_SET); // 文件偏移
        write(fd, buf, buf_size); // 写文件
        fsync(fd);                // 刷文件

        lseek(fd, 5000 + off, SEEK_SET); // 文件偏移
        write(fd, buf, buf_size);        // 写文件
        fsync(fd);                       // 刷文件

        ++num;
    }
    return NULL;
}

int main()
{
    printf(" main thread = %d \n", tid);

    // 创建线程
    pthread_t t1;
    pthread_create(&t1, NULL, thread_func, &file_off1);
    pthread_t t2;
    pthread_create(&t2, NULL, thread_func, &file_off2);
    sleep(1);
    printf(" threads are created \n");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    printf(" after threads exit \n");
    return 0;
}