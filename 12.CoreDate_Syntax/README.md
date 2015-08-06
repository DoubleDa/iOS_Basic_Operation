#CoreDara
* object graph management and persistence *
* Chapter 1: Your First Core Data App
	* Modeling your data
		- managed object model( Core Data uses an SQLite database as the persistent store )
		-  entities sound a lot like a classes. Likewise, attributes/relationships sound a lot like properties. What’s the difference? You can think of a Core Data entity as a class “definition” and the managed object as an instance of that class.
	* 注意点：
		

###cp: UIAlertView,UIAlertViewController difference:
	- 生成一个alertView/actionSheet
		- alertView中添加代码(UIAlertViewDelegate)
		```Swift
		 var alertView = UIAlertView(title:"Title",message:"Message",delegate:self,cancelButton:"Cancel",otherButtonTitle:"1","2","3")
		 alertView.alertViewStyle = UIAlertViewStyle.Login
		 alertView.show()
		```