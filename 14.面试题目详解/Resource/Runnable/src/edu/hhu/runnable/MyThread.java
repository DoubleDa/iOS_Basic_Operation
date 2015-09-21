package edu.hhu.runnable;

public class MyThread implements Runnable {
	private String name;
	public MyThread (String name) {
		this.name = name;
	}
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 0; i < 100; i++) {
			System.out.println("线程开始:"+this.name+",i="+i);
		}
	}

}
