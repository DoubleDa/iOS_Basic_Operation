# iOS 多线程（三）NSOperation

##NSOperation

> NSOperation是苹果封装的一套多线程的东西，不像GCD是纯C语言的，这个是OC的。但相比较之下GCD会更快一些，但本质上NSOPeration是多GDC的封装。

####NSOperation相对于GCD：
 - NSOperation拥有更多的函数可用
 - NSOperationQueue中，可以建立各个NSOperation之间的依赖关系。
 - NSOperationQueue支持KVO。可以监测operation是否正在执行（isExecuted）、是否结束（isFinished），是否取消（isCanceld）
 - GCD只支持FIFO的队列，而NSOperationQueue可以调整队列的执行顺序

##NSOperation剖析:

> NSOperation是个抽象类，并不具备封装操作的能力，必须使用它的子类

####使用NSOperation子类的方式有3种:
 - NSInvocationOperation
 - NSBlockOperation
 - 自定义子类继承NSOperation，实现内部相应的方法

####NSOperationQueue
 1. NSOperation可以调用start方法来执行任务，但默认是同步执行的
 2. 如果将NSOperation添加到NSOperationQueue（操作队列）中，系统会自动异步执行NSOperation中的操作
 ```
 // 添加操作到NSOperationQueue中
- (void)addOperation:(NSOperation *)op;
- (void)addOperationWithBlock:(void (^)(void))block;
 ```


##NSOperation的使用:

配合使用NSOperation和NSOperationQueue就能实现多线程编程:
 1. 将需要执行的操作封装到一个NSOperation对象中
 2. 将NSOperation对象添加到NSOperationQueue中
 3. 系统会自动将NSOperationQueue中的NSOperation取出来放到一条新线程中执行


 - NSInvocationOperation子类
 - NSBlockOperation子类
 - 自定义NSOperation


##NSOperation方法

 1. 最大并发数

 > 可以通过对最大并发数设置，控制程序中线程的数量

 2. 取消、暂停、恢复

 3. 依赖

 4. 操作的监听