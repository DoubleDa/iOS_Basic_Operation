#iOS网络编程
* BSD套接字，CFNetwork framework，Foundation framework API，CFURL 等 ，我们会重点以HTTP协议来熟悉网络编程 *
* 系统自带(native)：
	1. 确定请求:NSURL,NSURLRequest
	`let url = NSURl(string:"http:www.baidu.com")` ,`let request = NSURLRequest(NSURL:url)` 
	2. 发送请求:NSURLConnection(异步为主，同步阻塞界面)
	`NSURLConnection.sendAsynchronousRequst(request,queue:NSOperationQueue(),{{(_,data,error) -> Void in <code> }})1
	3. Data(image,pdf,二进制，Json) 格式(NSData,Json)
	4. 序列化(简单直接引用数据) 
* eg: 
	1. 返回一张一个二维码图片(image)
	`self.name.image = UIImage(data:data)`
	2. 返回天气预报(Json)
***
# 优化UI显示速度
# REST(Representational State Transfer)架构，Alamofire，注册API ，代码复用，批量获取，自定义Serializer(序列化)
* REST架构,JSON
	1. 资源的定位(URI)
	2. 操作方法(HTTP(GET,POST))
	3. 表现形式(html,xml,json)

* eg Alamofile
	- 发送请求(https://api.500px.com/v1/photos) Consumer Key :2nLJOm0Lv33m7swnnDM5cbWjpJknPYmL1y9quhhO
	- 在返回的响应(Response)中处理数据
		- 集合(NSSet NSOrderedSet NSMutableOrderedSet) (在闭包中使用参数加self)
		- 取照片集合的每张图片对象(objectAtIndex) Alamofire执行请求获取相应
		- 代码复用 enum 构造不同的URL请求 URLRequestConvertible(Alamofire)
		- enum(static(URL,key) ,请求类型以及参数
		- 批量获取(API 加参数)
			- 状态变量（正在获取当前页）
			- 何时获取(用户滑动接近页面底部时候)
			- 高优先级解析照片组
			- 对UI的操作必须在主队列
			- 定制Seriallzer
	- Response Json
	- 序列化(serialization)为JSON对象
		 - 定制Seriallzer (completionHandler) request responseImage 
		 - Dequeue 和 Reuse 不在屏幕上显示的cell即被收回
		 - 当用户滑动的时候，取回的数据已经不在需要了
		 - Solution：上一个image不显示检查请求的URL(网络延迟)
break Swift
