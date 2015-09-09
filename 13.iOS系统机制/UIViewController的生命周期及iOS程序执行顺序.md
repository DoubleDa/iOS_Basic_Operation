#UIViewController的生命周期及iOS程序执行顺序


- 当一个视图控制器被创建，并在屏幕上面显示的时候，代码的执行顺序:
 1. alloc	
 2. init(initWithNibName)
 3. loadView
 4. viewDidLoad
 5. viewwillAppear
 6. viewDidAppear

- 当一个视图被移除屏幕并且销毁的时候，执行顺序相反:
 1. viewWillDisappear
 2. viewDidDispatch
 3. dealloc
 
- UIViewController类对象方法，(后四种有动画，返回值Bool类型)
	- viewDidLoad
	- viewDidUnload
	- viewWillAppear
	- viewDidAppear
	- viewWillDisappear
	- viewDidDisappear

- APP在运行时的调用顺序

- IOS 开发 loadView 和 viewDidLoad 的区别