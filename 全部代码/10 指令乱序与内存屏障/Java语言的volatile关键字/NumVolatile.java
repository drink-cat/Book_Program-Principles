package org.test3.volatilex;

public class NumVolatile {
    // 数字。有volatile的场景。
    private static volatile long numWithVolatile = 0;

    // 线程的任务。有volatile的场景
    private static class NumTaskWithVolatile implements Runnable {
        @Override
        public void run() {
            for (int m = 0; m < 9000000; m++) {
                numWithVolatile = numWithVolatile + 1;
            }
        }
    }

    // 数字。没有volatile的场景。
    private static long numWithoutVolatile = 0;

    // 线程的任务。没有volatile的场景
    private static class NumTaskWithoutVolatile implements Runnable {
        @Override
        public void run() {
            for (int m = 0; m < 9000000; m++) {
                numWithoutVolatile = numWithoutVolatile + 1;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        // 多个线程。有volatile的场景
        Thread thread1 = new Thread(new NumTaskWithVolatile());
        Thread thread2 = new Thread(new NumTaskWithVolatile());

        // 等待线程执行完成。查看耗时
        long beginMillis = System.currentTimeMillis();
        thread1.start();
        thread2.start();
        thread1.join();
        thread2.join();
        long costMillis = System.currentTimeMillis() - beginMillis;
        String tmp = "有volatile的场景  耗时=" + costMillis + "  num=" + numWithVolatile;
        System.out.println(tmp);

        //----------------
        // 多个线程。没有volatile的场景
        Thread thread3 = new Thread(new NumTaskWithoutVolatile());
        Thread thread4 = new Thread(new NumTaskWithoutVolatile());

        // 等待线程执行完成。查看耗时
        long beginMillisB = System.currentTimeMillis();
        thread3.start();
        thread4.start();
        thread3.join();
        thread4.join();
        long costMillisB = System.currentTimeMillis() - beginMillisB;
        String tmpB = "没有volatile的场景  耗时=" + costMillisB + "  num=" + numWithoutVolatile;
        System.out.println(tmpB);
    }
}