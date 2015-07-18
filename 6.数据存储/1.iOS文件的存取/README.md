#iOS文件存取
** 本课程讲解保存和读取文件。**
	* 课程背景:开发iOS应用时，可能会把数据缓存到本地以减少不必要的网络通信，制作音乐播放类软件时还会提供下载，这些都要求会iOS系统的文件相关操作功能。 *
## 1.iOS应用沙盒 03:06
	本课讲解iOS的应用沙盒概念   ** APP Sandbox in Depth **
		核心内容：
		* 1.应用沙盒。
		* 2.读取和保存文件。

## 2.写出文件 06:57
	本课讲解如何在iOS系统中保存文件 

	```Swift
	// enum NSSearchPathDirectory : UInt 
		var searchPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask,true)
		var url = NSURL(fileURLWithPath:"\(sp[0])/data.txt")
		println(url!)
	// 以上为在计算机中创建一个URL

		var data = NSMutableData()
	// 返回指定编码的NSData对象，可以选择无损转化	
		data.appendData("Hello Swift\n".dataUsingEncoding(USUTF8StringEncoding,allowLossyConversion:true)!)
		data.writeToFile(url!.path!,atomically:true)
		println("end")
	```

## 3.读取文件 02:34
	本课讲解如何读取一个文件的数据
	```Swift
		var str = NSString(contentsOfURL:url!,encoding:NSUTF8StringEncoding,error:nil)
		println(str)
	```

