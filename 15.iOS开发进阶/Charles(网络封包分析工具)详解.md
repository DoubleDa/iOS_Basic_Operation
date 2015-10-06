# Charles(网络封包分析工具)详解

Charles 是Mac下常用的截取网络封包的工具。通过将自己设置成系统的网络访问代理服务器，是所有的网络访问请求都通过它来完成，从而实现了对网络封包的截取和分析。

####Charles简介

	- 支持SSL代理
	- 支持流量控制，可以模拟慢网速以及等待时间较长的请求。
	- 支持AJAX调试。自动将JSON或XML数据格式化，方便查看。
	- 支持AMF调试调试。可以将 Flash Remoting 或 Flex Remoting 信息格式化，方便查看
	- 支持重发网络请求，方便后端调试。
	- 支持修改网络请求参数。
	- 支持网络请求的截取和动态修改。
	- 检查HTML、CSS 和 RSS 内容是否符合 W3C 标准。

####Charles的安装和使用

 	- [Charles官方网站](http://www.charlesproxy)下载安装包,进行安装
	- 根据需求安装SSL证书，可以参照[官方文档教程](http://www.charlesproxy.com/documentation/using-charles/ssl-certificates/)
	- 将MAC设置为系统代理
	- 过滤网络请求(两种方法),只监控指定目录服务器上发送的请求
		- 主界面的Filter栏中填入过滤关键字。eg(www.baidu.com 只需要填入 baidu)，主要用于临时性的封包
		- 菜单栏 "Proxy" -> "Recording Settings" ,然后选择Include页面，选择添加一个项目，填入需要监控的协议、主机地址、端口号。用于经常性的封包过滤

####使用Charles协助开发iOS开发

	- 截取iPhone上的网络封包
	 	- Charles代理功能打开。菜单栏上面选择 "Proxy" -> "Proxy Setting" , 填入代理端口 8888 ，勾选 “Enable transparent HTTP proxying ” 。
		- iPhone设置
			- 获取电脑的IP地址(terminal中输入 `if config en0`),或者在 “Preference” -> "网络" 中查看
			- iPhone的 "设置" -> "无线局域网" 中看到当前连接的 WiFi 名，单击右边的详情按钮，在其底部有 "HTTP代理" 代理一项，将其切换成手动，填上Charles运行所在电脑的IP地址，端口号 8888 。
			- 打开iPhone上任意需要网络通讯的程序，可以看到Charles弹出请求连接确认菜单,单击 "Allow" 按钮完成设置
	- 模拟慢网速: 模拟慢网速或者高延迟的网络，测试在移动网络下应用的表现是否正常
		- Charles菜单栏 "Proxy" -> "Throttle Setting" ，弹出对话框中勾选 "Enable Throttle" ,并设设置 Throttle  Preset类型
		- 如果只想模仿指定网站的慢网速，再勾选 "Only for selected hosts" 项，然后再对话框下半部设置中增加指定的Hosts项。

#### 高级功能
	
	- 截取SSL信息
		- Charles 默认不截取SSL信息，若要截取某网站的SSL网络请求，可以在改请求上面单击右键，选择 "SSL proxying"
	- 修改网络请求的内容
		- 为了调试服务器接口，需反复尝试不同参数的网络请求，只需在网络请求上单击右键，选择 "Edit" 即可
		- 我们可以修改请求的 URL地址、端口、参数等，之后单击 "Execute" 按钮，即可发送修改后的网络请求
	- 修改服务器返回内容: 想让服务器返回一些指定的内容。 eg(列表页面为空、数据异常、部分耗时网络请求超时等情况)
		- Map功能: 适合长期的将某一些请求重定向到另一个网络地址或者本地地址。
		- Rewrite功能: 适合将网络请求进行一些正则替换
		- Breakpoints功能: 适合做一些临时性的修改

#### Map功能

#### Rewrite功能

#### Breakpoints功能

