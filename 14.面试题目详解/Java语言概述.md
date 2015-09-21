# Java语言概述

- Java语言的基本特征
	- 面向对象
	- 可移植性
	- 安全性
	- 并发性
	- 封装继承多态抽象
	- 高性能，多线程

- Java定义接口的关键字: interface
- Java实现接口的关键字: implements (class Thread implements Runnable)
- Java继承类的关键字:  extends 

- Java程序的入口函数原型：main函数
- Java在命令行编译命令: javac
- 执行命令：java

- Java多线程类: Thread类
- Java多线程接口: Runnable类

- 抽象类，接口的异同点

 > 接口是公开的，里面不能有私有的方法或变量，是用于让别人使用的，而抽象类是可以有私有方法或私有变量的;
   实现接口的一定要实现接口里定义的所有方法，而实现抽象类可以有选择地重写需要用到的方法，一般的应用里，最顶级的是接口，然后是抽象类实现接口，最后才到具体类实现。
   接口可以实现多重继承，而一个类只能继承一个超类，但可以通过继承多个接口实现多重继承，接口还有标识（里面没有任何方法，如Remote接口）和数据共享（里面的变量全是常量）的作用.

	- 相同点:
		- 他们都能不能生成实例，都有抽象方法。 
		- 接口是特殊的抽象类。  
		- 接口和抽象类的继承都使用的关键字是extends。
	- 不同点:
		- 1.接口的定义的变量默认是public static final型，且必须给其赋初值。所以在实现类中不能重新定义，也不能改变其值。而在抽象类中其值在子类中可以重新定义也可以重新赋值。  
		- 2.接口的方法默认的都是public abstract类型的。  
		- 3.抽象类中可以有构造器，但是接口中除了抽象方法什么都没有。 
		- 4.名字不同，接口写的是public interface  Shape{}； 而抽象类写的是public  abstract class Shape{}；  接口里全部都是抽象方法。而抽象类里可以有抽象方法也可以有其他的方法。接口里的属性都是静态的。但是抽象类的属性可以是任意的。 
		- 5.还可以从继承的角度看，接口可以多继承，一个接口可以继承多个接口。但是抽象类却不能，只能是继承一个父类，不能继承多个父类。要是能继承多个父类的话会在父类和子类的方法中有发生冲突。

- Java实现多继承
	- 继承Thread类 
		- Thread类是在java.lang包中定义的，一个类只要继承了Thread类同时覆写了本类中的run()方法就可以实现多线程操作了,但是一个类只能继承一个父类。
		- 调用 .start() 函数启动线程完成交互，在JDK的安装路径下，src.zip是全部的java源程序，通过此代码找到Thread中的start()方法的定义，可以发现此方法中使用了private native void start0();其中native关键字表示可以调用操作系统的底层函数，那么这样的技术称为JNI技术（java Native Interface）
	- 实现Runnable接口
		- 实际开发中一个多线程的操作很少使用Thread类，而是通过Runnable接口完成。
		- 在使用Runnable定义的子类中没有start()方法，只有Thread类中才有。此时观察Thread类，有一个构造方法：public Thread(Runnable targer)
		- 此构造方法接受Runnable的子类实例，也就是说可以通过Thread类来启动Runnable实现的多线程
		- 两种实现方式的区别和联系：在程序开发中只要是多线程肯定永远以实现Runnable接口为主，因为实现Runnable接口相比继承Thread类有如下好处：
			- 避免点继承的局限，一个类可以继承多个接口。
			- 适合于资源的共享
		- 可以看出Thread类是Runnable接口的子类。
	- 使用ExecutorService、Callable、Future实现有返回结果的多线程