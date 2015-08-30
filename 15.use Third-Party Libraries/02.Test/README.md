#the use of Third-Party Libraries(使用第三方库)

***

- MJRefresh
	- `self.tableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "headerRefresh")`
    - `self.tableView.addGifFooterWithRefreshingTarget(self, refreshingAction: "footerRefresh")`
    - ```
    	func delay(time:Double,closure:() ->()){
        	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    	}
      ```
- ProgressHUD
	- show()
	- showSuccess()
	- showError()
	- dismiss()
- PathCover(个人主页)
- SDWebImage(异步加载图片)
	- 第三方库导入 
	- 异步加载图片
	- 自动本地缓存
	- 清除缓存
- Extension(class,struct,enum添加新功能，没有获取源代码的情况下扩展类型能力(逆向建模)) 类似Objective-C中的categories,但是Swift的扩张没有名字
	- 添加实例方法，类型方法
	- 添加计算型实例属性，计算型类型属性
	- 添加新的构造器
	- 添加新的下标
	- 新的嵌套类型
	- 使一个已有类型符合某个接口

> Note: 扩展可以添加新的计算属性，但是不可以添加存储属性，也不可以向已有属性添加属性观测器(property observers)

- 自定义类型: 制作状态栏 实现画线 (Graphics context -> 画布 view -> 画框)
	- CGContextRef
	- CGPath
	- UIBezierPath
- PhotoBrowser:
- XActionSheet上拉菜单
- 自定义第三方库(YNActionSheet)
- DOImagePicker(照片选择器)
- SwipeableCell(左滑编辑)
- EAIntroView(引导页面)

### 演示
![homePage](/15.use Third-Party Libraries/02.Test/Resource/personalHomepage.gif)