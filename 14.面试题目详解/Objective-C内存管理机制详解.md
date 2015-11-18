# Objective-C 内存管理机制详解 

// 如何避免retain 的死循环 callstack, cocoa框架， 非 Cocoa程序？

1. 在 非ARC 中内存的创建及释放:

 ```
 id testObject = [[ClassName alloc]init];
 [testObject release];
 ```

 > Note:
  1. 调用 alloc 创建一块只属于它的内存，引用计数 +1，另外 retain，copy 两个关键字也会将对象的引用计数 +1；
  2. 调用 release 对象引用计数 -1 如果为0马上释放，autorelease 对象引用计数 -1 ，如果为0不马上释放，释放最近的一个pool

 内存管理的原则就是最终的引用计数要平衡，如果最后引用计数大于0 则会内存泄露，如果引用 计数等于0还对该对象进行操作，则会出现内存访问失败，crash 所以尽量设置为nil，这两个问题都很严重，所以请一定注意内存释放和不用过后设置为nil。

 release 后的对象，虽然已经释放，但是它的指针地址仍然存在，只是指向一块已经释放的无用内存，所以我们建议 release 后直接赋个 nil 来置空

 一般，如果我们能知道需要实现功能所涉及的“className”的具体类名，就不建议使用init方法去初始化，比如以下代码 `NSString *str = [[NSString alloc]initWithString:@"test"]; // recommend`


2. 类方法与实例方法:

 ```
 -(id)initWithString:(NSString *)aString;
 +(id)initWithString:(NSString *)aString;
 ```

3. 属性关键字: 

 - MRC: 默认为 atomic, assign, readwrite

 ```
 // @property  后面括号的特征性关键字告诉编译器后面的变量用何种方式来存取
 @property (nonatomic,assign) int B;
 @property (nonatomic,retain) id classObj;
 ```

 关于nonatomic,如果我们能确定不需要多线程访问时，强烈推荐使用这个关键字，因为atomic对于性能的损失相对较大

 如果是类的delegate，推荐使用assign关键字，原因是避免了retain的死循环造成的对象无法真正的释放

 copy 属性主要是 字符串选择性使用， 属性必行服从 NSCopy 协议

 `@dynamic` 关键字表示系统系统会推迟到运行时才动态生成相应地方法

 - ARC:  新增 strong 和 weak 不过只能修饰对象,其他用法和 retain , assign 一样

 > Notes: 苹果官方对于ARC机制中对象的内存引用规则：
  1. 任何对象，如果仍有持有者，就不会销毁
  2. 任何对象，已经没有任何持有者，即自动销毁
  3. 持有者就是指向对象的指针，如果是strong修饰的，即是对象的持有者，如果是weak属性的，则不是持有者


4.ARC机制的使用规则

   对于ARC机制的使用，苹果发布了几条重要的规则需要开发者遵守。单单看那些生搬硬套的东西难免生涩，根据开发经验将规则总结如下：

   (1)不能调用dealloc,不能重写和调用retain，release，retainCount 和autorelease，同理，@selector(retain),@selector(release)这些曲线救国的方法也不能调用。 dealloc虽然能够重写，但是不能调用[super dealloc]之类的方法,CoreFoundation框架由于非从属cocoa框架，所以CFRetain和CFRelease仍然正常使用。

   (2)不能使用NSAllocateObjec或NSDeallocateObject函数来创建对象

   (3)不能在C语言的结构体中使用对象指针，同时建议用object-c的类来管理数据而不是结构体

   (4)不得使用NSAutoreleasePool对象。ARC中，全部使用@autorelease关键字代替，且比NSAutoreleasePool更高效

   (5)不得使用内存Zone,那些牵涉NSZone的方法都不得使用。

   (6)不得对一个属性变量的取值方法命名以new开头

   (7)outlet均用weak关键字修饰，除非他是xib中最顶部的界面元素，则需要strong。

   (8)Core Foundation不适合ARC，该创建的仍创建，该释放的仍释放。

5. autoreleasepool: 可以在某些情况下，大幅度降低程序的内存占用
  
 -[NSAutoreleasePool release] 方法最终通过 AutoreleasePoolPage 为结点的双向链表来实现

 我们是不需要手动添加 autoreleasepool 的，使用线程自动维护的 autoreleasepool就好了，但是有3种情况需要手动添加 autoreleasepool 

       1. 编写的程序不是基于 UI 框架的，基于命令行程序时，如 AppKit 等 Cocoa 框架
       2. 编写的循环中创建了大量的临时对象
       3. 创建了一个辅助线程 (非Cocoa程序创建线程时才需要)
       4. 长时间在后台运行的任务

 Autorelease实际上只是把对release的调用延迟了，对于每一个Autorelease，系统只是把该Object放入了当前的Autorelease pool中，当该pool被释放时，该pool中的所有Object会被调用Release。

 对于每一个 Runloop ，系统会隐式的创建一个 Autorelease pool，这样所有的 release pool 会构成一个像 CallStack 一样的栈式结构，在每一个 RunLoop 结束时，当前栈顶的 Autorelease pool 会被销毁，这样这个 pool 里面的每个 Object 会被 release

 一个 UI事件， Timer call,delegate call 都会是一个新的 RunLoop

 一定要注意Autorelease pool的生存周期，理解Runloop，避免在对象被释放后使用。

 [NSString stringWithFormat:]这类函数返回的对象是不需要再自己release的，它已经被autorelease了, 如果你想把它当一个全局对象使用，那必须自己再retain， 释放时再release。

6. MAR 和 ARC

 MRC（Mannul Reference Counting）和ARC(Automatic Reference Counting)，分别对应着手动引用计数和自动引用计数。

 是计数，不是“GC、垃圾回收”什么的，就是说，在ObjectiveC的开发中，ARC不代表像Java那样有GC做垃圾回收，所以本质上还是要“手动”管理内存的。也就是说，我们在ARC环境下写的代码，不用自己手动插入“ retain、release这些消息 ”，ARC会在编译时为我们在合适的位置插入，释放不必要的内存。

 但是在ARC时代，我们不用手动发送 autorelease 消息，ARC会自动帮我们加。而这个时候， @autoreleasepool 做的事情，跟 NSAutoreleasePool 就一模一样了。

 ```
 NSArray *urls = <# An array of file URLs #>;
 for (NSURL *url in urls) {
  @autoreleasepool {
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfURL:url
                     encoding:NSUTF8StringEncoding error:&error];
    /* Process the string, creating and autoreleasing more objects. */
  }
 }
 ```
