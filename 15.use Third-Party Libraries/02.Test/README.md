##使用两个 第三方库

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