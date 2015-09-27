# Swift面试基本概念

- Swift中有没有隐式转换类型 
  - option类型 c，c++ int 转化为double
- 一个队列并行10个线程
- iOS中alloc new 区别
- Swift命名空间，C++，Java有没有用名空间，
- block 闭包区别(其实是没有区别，同样的东西)
- Nsstring和String区别，一个是引用类型，一个是值类型(struct)，使用那个String值传递速度快
- GCD并行线程问题
- 并发问题
- Xcode如何设置全局断点(设置全局断点并快速定位问题代码)
	- Run -> Show -> Breakpoint,进入断点窗口
	- Conditional BreakPoints: 条件断点(满足一定的条件才停止，捕获特定值或者一些不常发生的情况)
		1. 添加一个普通断点
		2. 右键点击断点选择'Edit Breakpoint'
		3. 打开断点编辑器，设置断点条件
	- Global BreakPoint: 全局断点 当应用产生异常或崩溃时Xcode一般会直接跳到主函数。但这并不是我们想要的, 我们想要的是产生异常或崩溃能够停留在异常或者崩溃发生的地方而不是跳转到主函数
		- 异常断点: 允许我们在异常发生时在异常发生的地方放一个断点。你可以指定具体的异常也可以指定所有的异常。
			1. 工程切换到异常浏览窗口,点击下方左侧的“Add Breakpoint” 按钮
			2. 选择“Add Exception Breakpoint”确保可以捕获所有异常
	- GDB命令来调试程序: 一般情况下，我们在程序代码中添加断点，是为了通过Xcode提供的‘variables view’（该view在Xcode底部console旁边）来查看变量的状态 。理论上，该窗口可以显示出与当前上下文相关的所有值的状态。实际上，这有点小问题，有时候断点过了之后，该窗口并不会进行相关的更新。但是Xcode有一个很不错的功能是：我们可以使用控制台的命令来检查某个特定的对象——这对于调试程序非常有用
		1. po 命令：为 print object 的缩写，显示对象的文本描述（显示从对象的 description 消息获得的字符串信息, 如果对象不存在的话会打印出nil）。
		2. 处理scalar值时使用‘p’
		3. 输出view的层级关系. （但是被隐藏的命令）, recursiveDescription。
		4. 其它命令(help):
		
			　　1.命令                        解释  
			　　2.break NUM               在指定的行上设置断点。  
			　　3.bt                      显示所有的调用栈帧。该命令可用来显示函数的调用顺序。  
			　　4.clear                   删除设置在特定源文件、特定行上的断点。其用法为：clear FILENAME:NUM。  
			　　5.continue                继续执行正在调试的程序。该命令用在程序由于处理信号或断点而  
			　　6.                        导致停止运行时。  
			　　7.display EXPR            每次程序停止后显示表达式的值。表达式由程序定义的变量组成。  
			　　8.file FILE               装载指定的可执行文件进行调试。  
			　　9.help NAME               显示指定命令的帮助信息。  
			　　10.info break              显示当前断点清单，包括到达断点处的次数等。  
			　　11.info files              显示被调试文件的详细信息。  
			　　12.info func               显示所有的函数名称。  
			　　13.info local              显示当函数中的局部变量信息。  
			　　14.info prog               显示被调试程序的执行状态。  
			　　15.info var                显示所有的全局和静态变量名称。  
			　　16.kill                    终止正被调试的程序。  
			　　17.list                    显示源代码段。  
			　　18.make                    在不退出 gdb 的情况下运行 make 工具。  
			　　19.next                    在不单步执行进入其他函数的情况下，向前执行一行源代码。  
			　　20.print EXPR              显示表达式 EXPR 的值。  
			　　21.  
			　　22.print-object                        打印一个对象  
			　　23.print (int) name                    打印一个类型  
			　　24.print-object [artist description]   调用一个函数  
			　　25.set artist = @"test"                设置变量值  
			　　26.whatis                              查看变理的数据类型

- SDWebImage