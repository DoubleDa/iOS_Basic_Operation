#课程背景：
iOS提供的用户首选项数据API，用于存储简单的用户配置信息，实用、方便、高效。

##核心内容：
* 1.写用户首选项数据
*2.读取用户首选项数据

###1:用户首选项数据说明 01:40
	本课讲解iOS首选项数据的概念及用途
		 配置应用程序相关信息状态（eg:Settings）key-value 比较小  

###2:存储用户首选项数据 04:02
	本课讲解如何存储用户首选项数据
		```Swift
			var userDefault = NSUserDefaults.standardUserDefaults()
			userDefault.setObject(inputText.text,forKey:"data")
			println("Saved")
		```

###3:读取用户首选项数据 03:57
	本课讲解如何读取用户首选项数据
		```Swift
			if let value = userDefault.objectForkey("data"){
				inputText.text = value as! String
			}else{
				inputText.text = "没有值"
			}

		```

###4:启动时小贴士实例 06:19 (userDefaults)
	本课用一个小实例演示用户首选项数据的使用场景
		```Swift
			var ud = NSUserDefaults.standardUserDefaults()
        MySwitch.on = ud.boolForKey("showTips")
        
        if MySwitch.on{
            UIAlertView(title: "提示", message: "下雨要带雨伞啦啦啦啊啦啦", delegate: nil, cancelButtonTitle: "好的").show()
        }
		```

		```Swift
			    @IBAction func valueChanged(sender: AnyObject) {
        			ud.setBool(MySwitch.on, forKey: "showTips")
    			}
		```