package edu.hhu.thread;

public class ThreadDemo01 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyThread mt1 = new MyThread("线程a");
		MyThread mt2 = new MyThread("线程b");
		// 调用run方法，结果很有规律，先第一个对象执行，然后第二个对象执行，并没有相互运行
//		mt1.run();
//		mt2.run();
		// 一旦调用start()方法，则会通过JVM找到run()方法。下面启动start()方法启动线程,这样程序可以正常完成交互式运行
		// 在JDK的安装路径下，src.zip是全部的java源程序，通过此代码找到Thread中的start()方法的定义，可以发现此方法中使用了private native void start0();
//		其中native关键字表示可以调用操作系统的底层函数，那么这样的技术称为JNI技术（java Native Interface）
		mt1.start();
		mt2.start();
	}

}
