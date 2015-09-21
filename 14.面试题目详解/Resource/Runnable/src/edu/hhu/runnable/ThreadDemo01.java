package edu.hhu.runnable;
import edu.hhu.runnable.MyThread;
public class ThreadDemo01 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyThread mt1 = new MyThread("线程a");
		MyThread mt2 = new MyThread("线程b");
		new Thread(mt1).start();
		new Thread(mt2).start();
	}

}
