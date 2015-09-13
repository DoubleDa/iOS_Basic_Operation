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
3.  NSRunLoop的以下描述