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

		 func alertView(alertView:UIAlertView,clickedButtonAtIndex buttonIndex:Int){
		 	UIAlertView(title:"Title",message:"Message",delegate:nil,cancelButtonTitle:"OK",otherButtonTitles:"1","2").show()
		 }
		```
* NSManagedObject
* cell.textLabel.text
> Note KVC(valueForKey)
KVC is a mechanism in Cocoa and Cocoa Touch for accessing an object’s properties indirectly using strings to identify properties. In this case, KVC makes NSMangedObject behave more or less like a dictionary.

## using strings instead of strongly-typed classes.

# The Core Data Stack
The stack is made up of four Core Data classes:
• NSManagedObjectModel
• NSPersistentStore
	- NSQLiteStoreType
	- NSXMLStoreType
	- NSBinaryStoreType
	- NSInMemoryStoreType
	- NSIncrementalStore(JSON CSV)
• NSPersistentStoreCoordinator 
*NSPersistentStoreCoordinator is the bridge between the managed object model and the persistent store.*
	- 1. NSManagedObjectContext (coming next!) doesn’t have to know if it’s saving to an SQLite database, XML file or even iCloud.
	- 2. If you have multiple persistent stores, the persistent store coordinator presents a unified interface to the managed context. As far as the managed context is concerned, it always interacts with a single, aggregate persistent store.
• NSManagedObjectContext

#Chapter4:Intermediate fetching
* Sorting fetched results
* Asynchronous fetching
`var asyncFetchRequest: NSAsynchronousFetchRequest!`

