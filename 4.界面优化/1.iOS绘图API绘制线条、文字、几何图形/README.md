#4.1iOS绘图API绘制线条/文字/几何图形
*课程背景：学会使用绘图API，对于自定义控件、优化UI控件非常重要*

**核心内容：**
* 1.绘制线条。
* 2.绘制文字。
* 3.绘制几何图形。

***

### 1.iOS绘图API-绘制线条 07:19
	New File ,绑定一个UIView,init(frame:CGRect),init(coder aDecoder:NSCoder)
	```Swift
		var context = UIGraphicsGetCurrentContext()
		CGContextMoveToPoint(context,100,100)
		CGcontextAddLineToPoint(context,100,200)
		CGcontextSetRGBStrokeColor(context,1,1,1,1)
		CGcontextSetLineWidth(context,5)

		CGContextStrokePath(context,5)
	```

### 2.iOS绘图API-绘制矩形 09:39


### 3.iOS绘图API-绘制圆形 09:02


### 4.iOS绘图API-绘制图片 08:42
	使用iOS绘图API把图片绘制到UIView上

### 5.iOS绘图API-画板实例 08:37
	使用iOS绘图API制作简易画板
