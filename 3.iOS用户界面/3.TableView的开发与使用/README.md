# UITableViewController,UITableView,UITableViewCell的应用:
***
### (UITableViewDataSource)其中包含几个重要方法:
* numberOfSectionsInTableView
* tableView(...,numberOfRowsInSection section:Int)
* ```Swift
	func tableView(tableView:UITableView,cellForRowAtIndexPath indexPath:NSIndexPath) ->UITableViewCell{
		let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
		var label = cell.withTag() as! UILabel
		label.text = [String][indexPath.row].
		return cell
	}
 ```
* ```Swift
	func tableView(tableView:UITableView,didSelectRowAtIndexPath indexPath:NSIndexPath){
		
	}
  ```

### 注意点:
* 给tableviewCell 一个 identifier，
* label/imageView一个Tag使用 cell.viewWithTag() as! UILabel/UIImageView
* UITableViewDataSource ---   self.dataSource = self
* 与列表项进行交互(UITableViewDelegate) UITableViewDelegate --- self.delegate = self
* 从Supporting Files 中读取数据 
```Swift
	data:NSDictionary!

	data = NSDictionary(contentsOfURL:NSBundle.mainBundle().URLForResource("data","plist")!)!
```

### 没有实现点击selected cell 跳转到特定界面； 跳转页面的之间的传值
```Swift
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
```

http://api.juheapi.com/jhbar/bar?appkey=key&pkg=com.thinkland.test&barcode=6923450605332&cityid=1
 AppKey：	
5dde6d0cf313b93ba47798b6ad4b910f