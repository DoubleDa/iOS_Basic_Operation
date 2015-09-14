#iOS 选择题

1. NSURLConnectionDelegate协议主要有如下4个常用方法：
	- connection: didReceiveResponse:  // 开始接收到服务器的响应时调用
	- connection: didReceiveData:  // 接收到服务器返回的数据时调用，服务器返回的数据比较大时会分多次调用
	- connection: didFinishLoading:  // 服务器返回的数据完全接收完毕后调用
	- connection: didFailWithError:  // 请求出错时调用，比如请求超时

2. assign,retain,weak,strong,copy,unsafe_unretained
	- readonly,readwrite：是控制属性的访问权限，readonly只生成getter方法，其他类是无法修改其值的。readwrite是会同时生成getter和setter方法，其他类可以修改其值。
	- assign, retain, weak, strong, copy,unsafe_unretained：
		 * 在non-ARC中，assign和retain是一组，assign的对象属性引用计数不变，而retain会被+1。
		 * 对应的在ARC中，weak和strong是一组，weak的对象属性引用计数不变，而strong会被+1。
		 * assign还用来赋值非对象属性，例如，int，double，BOOL，char等。
		 * copy用来设置不可变的对象属性，例如，NSString，NSArray，NSDictionary等。
		 * 在ARC中，一个属性被设置为weak，当出了作用域，其值会被设置成nil。与其相对应的是unsafe_unretained，unsafe_unretained不会改变对象属性的引用计数，同时出了作用域的时候，其值也不会被设置成nil。unsafe_unretained相当于non-ARC中的assign。
		 * atomic,nonatomic:atomic是原子操作，nonatomic是非原子操作，一般常用的是nonatomic,atomic原子属性的是多线程安全的。

3.  NSRunLoop的以下描述: 线程是默认启动run loop的 	
	- Runloop的作用在于当有事情要做时它使当前的thread工作，没有事情做时又使thread休眠sleep。Runloop并不是由系统自动控制的，尤其是对那些新建的次线程需要对其进行显示的控制。
	- 有3类对象可以被run loop监控：sources、timers、observers。当这些对象需要处理的时候，为了接收回调，首先必须通过 CFRunLoopAddSource ,CFRunLoopAddTimer 或者 CFRunLoopAddObserver 把这些对象放入run loop。 要停止接收它的回调，可以通过CFRunLoopRemoveSource从run loop中移除某个对象。 
	- 每一个线程都有自己的runloop, 主线程是默认开启的，创建的子线程要手动开启，因为NSApplication 只启动main applicaiton thread
	- NSTimer默认添加到当前NSRunLoop中，也可以手动制定添加到自己新建的NSRunLoop的中

4. AddressBook框架中常用的类:
	- ABAddressBook
	- ABPerson
	- ABGroup
	- ABRecord

5. NSAssert类似的宏有哪些
	- NSAssert()只是一个宏，用于开发阶段调试程序中的Bug，通过为NSAssert()传递条件表达式来断定是否属于Bug，满足条件返回真值，程序继续运行，如果返回假值，则抛出异常，并切可以自定义异常描述
	- NSAssert
	- NSAssert1
	- NSAssert2
	- NSAssert3
	- NSAssert4
	- NSAssert5

6. AddressBookUI框架中的视图控制器：
	- 只要是UIViewController都是视图控制器
	- AddressBookUI中查api知有 ABPeoplePickerNavigationController， ABPersonViewController， ABNewPersonViewController， ABUnknownPersonViewController

7. 创建联系人使用的函数有哪些？
	- ABPersonCreate
	- ABRecordSetValue
	- ABMultiValueCreateMutable
	- ABAddressBookSave

8. 为什么说Object-C是runtime language?
	- 将数据类型的确定由编译时，推迟到了运行时
	- 运行时机制使我们直到运行时才去决定一个对象的类别，以及调用该类别对象指定方法。
	- 多态是指不同对象以自己的方式响应相同的消息的能力

9. 三种导航模式
	- 平铺
	- 标签
	- 树形
		- 在树形结构导航模型中，会有两个根视图控制器：一个是应用程序根视图控制器，它是UINavigationController的实例，通过self.window.rootViewController属性指定；另一个导航控制器根视图控制器，通过UINavigationController的构造方法initWithRootViewController:指定，用于提供和呈现导航控制器的一级视图，即我们看到的第一个界面。(一个是Window的，一个是Navigation的)

10. Objective-C有哪几种内存管理方法：
	- 手动引用计数 MRC (Mannul Reference Counting);
	- 自动引用计数 ARC (Automatic Reference Counting);
	- MRR
	- GC

11. OC不支持多重继承，类可以实现多个接口,@class为了解决相互导入的问题;

12. iOS中数据持久化方式:
	- 属性列表(NSUserDefaults,存储配置信息)
	- 对象归档(使要使用对象归档,对象必须实现NSCoding协议.大部分Object C对象都符合NSCoding协议,也可以在自定义对象中实现NSCoding协议，用基本对象类型定制的个性化缓存方案)
	- SQLite
	- CoreData

13. 线程管理：
	- pthread NSThread GCD NSOperation
	pthread是一套通用的多线程API，适用于Unix\Linux\Windows，跨平台，是c语言，生命周期要手动管理
	NSThread是面向对象的，基于pthread的封装,也是手动管理生命周期
	GCD是OC管理多线程最好用的方案，没有之一，自动管理生命周期
	NSOperation是基于GCD的封装，所以问题不在于是NSOperation或者是NSOperationQueue,因为GCD是纯C的，所以，NSOperation以及GCD与NSThread半毛线关系都没有。

14. 模态视图专用属性有哪些: 
	- UIModalPresentationFullScreen，全屏状态，是默认呈现样式，iPhone只能全屏呈现。
	- UIModalPresentationPageSheet，它的宽度是固定的768点，在iPad竖屏情况下则全屏呈现。
	- UIModalPresentationFormSheet，它的是固定的540x620点，无论是横屏还是竖屏情况下呈现尺寸都不会变化。
	- UIModalPresentationCurrentContext，它与父视图控制器有相同的呈现方式。

15. 关于浅复制和深复制的说法，下列说法正确的是 
	- 浅层复制: 只复制指向对象的指针，而不复制引用对象本身。
	- 深层复制: 复制引用对象本身。
	- 如果是浅复制，修改一个对象会影响另外一个对象
	- 如果是深拷贝，修改一个对象不会影响到另外一个对象 
