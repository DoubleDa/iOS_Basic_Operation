# CALayer与UIView的关系详解

*CALayer 属于 Core Animation 而 UIView 是 iOS 界面的基本元素*
***

1. UIView 是 iOS 系统界面元素的基础，所有的界面元素都是继承自它，它本身是完全是由 Core Animation 来实现的。它真正的绘图部分是由一个 CALayer 的类管理的。

 UIView 本身像是一个 CALayer 的管理器，访问它的跟绘图和坐标有关的属性，frame bounds，实际上都是在访问它所包含的 CALayer 的相关属性