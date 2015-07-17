1.触摸事件处理 05:49
本课讲解如何处理iOS平台触摸事件

2.处理多个触摸点 02:42
本课讲解如何处理多个触摸点

3.缩放图片实例 10:42
用多点触控机制缩放图片


处理一个触摸点
touches as NSSet
触摸点的集合(touches)
touchesBegan
touchesMoved
touchesEnded

(touches as NSSet).anyObject().locationInView(slef.view).x

self.view.multipleTouchEnabled = true
通过for in 找出两个点