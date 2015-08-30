//
//  ViewController.swift
//  02.Test
//
//  Created by 游义男 on 15/8/26.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,HZPhotoBrowserDelegate, YNActionSheetDelegate{

    var tableView:UITableView!
    var dataArray = [String]()
    var head:XHPathCover!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.Grouped)
        self.view.addSubview(self.tableView)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.navigationItem.title = "Refresh"
        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        
        for(var i = 0;i<10;i++){
            self.dataArray.append("\(i)")
        }
        
       // self.tableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "headerRefresh")
        self.tableView.addGifFooterWithRefreshingTarget(self, refreshingAction: "footerRefresh")
    
        self.head = XHPathCover(frame: CGRectMake(0, 0, self.view.frame.width, 250))
        self.head.setBackgroundImage(UIImage(named: "BG.png"))
        self.head.setAvatarImage(UIImage(named: "bgImage.jpg"))
        self.head.isZoomingEffect = true // 下拉背景放大 模糊
        self.head.setInfo(NSDictionary(objectsAndKeys: "YouYinan",XHUserNameKey,"iOSDevelper",XHBirthdayKey ) as [NSObject : AnyObject])
        self.head.avatarButton.layer.cornerRadius = 33
        self.head.avatarButton.layer.masksToBounds = true
        self.head.avatarButton.addTarget(self, action: "PhotoBrowser", forControlEvents: .TouchUpInside)
        self.head.handleRefreshEvent = {
            self.headerRefresh()
        }
//        self.tableView.tableHeaderView = head
        
        var Line = LineView(frame: CGRect(x: 0, y: 250, width: self.view.frame.width, height: 60))
        var HeadView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 310))
        
        HeadView.addSubview(Line)
        HeadView.addSubview(head)
        
        tableView.tableHeaderView = HeadView
        
        
        head.sayHello()
        tableView.sayHello()
        
        // clear Cache
        SDImageCache.sharedImageCache().clearDisk()
        SDImageCache.sharedImageCache().clearMemory()
        
        
    }
    
    // MARK : Selector
    // 下拉刷新 覆盖
    func headerRefresh(){
        ProgressHUD.show("亲爱的，别急～～", interaction: true)
        self.delay(2, closure: { () -> () in
            self.dataArray.removeAll(keepCapacity: false)
            var i = 0
            for(i=0;i<10;i++){
                self.dataArray.append("\(i)")
            }
          //  self.tableView.header.endRefreshing()
            self.tableView.reloadData()
            self.head.stopRefresh()
            ProgressHUD.showSuccess("完成～～～")
        })
    }
    // 上拉加载 追加后面
    func footerRefresh(){
        ProgressHUD.show("上拉加载～～")
        self.delay(2, closure: { () -> () in
            var j = 10
            for(j;j<20;j++){
                self.dataArray.append("\(j)")
            }
            self.tableView.footer.endRefreshing()
            self.tableView.reloadData()
            ProgressHUD.showSuccess("准备好了～～")
        })
    }
    func PhotoBrowser(){
//        var action = XActionSheet()
//        action.delegate = self
//        action.addCancelButton("取消")
//        action.addButtonwithTitle("拍照")
//        action.addButtonwithTitle("相册")
//        action.addButtonwithTitle("查看高清大图")
//        self.presentViewController(action, animated: true) { () -> Void in
//            
//        }
        var action = YNActionSheet()
        action.delegate = self
        action.addCancelButtonWithTitle("取消")
        action.addButtonWithTitle("拍照")
        action.addButtonWithTitle("相册")
        action.addButtonWithTitle("查看高清大图")
        self.presentViewController(action, animated: true) { () -> Void in
            
        }
    }
    func delay(time:Double,closure:() ->()){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    // MARK : XActionSheetDelegate/ YNActionSheetDelegate
    func buttonClick(index: Int) {
        println("\(index)")
        if index == 2 {
                    var browserVC = HZPhotoBrowser()
                    browserVC.sourceImagesContainerView = head.avatarButton
                    browserVC.imageCount = 1 // 可以显示多张 左滑，右滑
                    browserVC.currentImageIndex = 0
                    browserVC.delegate = self
                    browserVC.show()
        }
    }
    
    // MARK : HZPhotoBrowserDelegate
    func photoBrowser(browser: HZPhotoBrowser!, placeholderImageForIndex index: Int) -> UIImage! {
        return head.avatarButton.currentImage
    }
    func photoBrowser(browser: HZPhotoBrowser!, highQualityImageURLForIndex index: Int) -> NSURL! {
        var url = NSURL(string: "http://g.hiphotos.baidu.com/zhidao/pic/item/77c6a7efce1b9d167b7caa51f0deb48f8c546442.jpg")
        return url
    }
    
    
    // MARK : UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    // MARK : UITableViewDelegate
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
//        cell.textLabel?.text = self.dataArray[indexPath.row]
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        var image = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        
        var url:NSURL = NSURL(string: "http://s1.dwstatic.com/group1/M00/AE/B4/c216a47354416d579df9f438f8c000ca.jpg")!
        image.sd_setImageWithURL(url, placeholderImage: UIImage(named: "cute_girl.jpg"))
        cell.contentView.addSubview(image)
        
        var label = UILabel(frame: CGRect(x: 80, y: 30, width: 100, height: 20))
        label.text = "\(indexPath.row)"
        cell.contentView.addSubview(label)
        
        return cell
    }
    
    
    // MARK : UIScrollView
    func scrollViewDidScroll(scrollView: UIScrollView) {
        head.scrollViewDidScroll(scrollView)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        head.scrollViewDidEndDecelerating(scrollView)
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        head.scrollViewDidEndDragging(scrollView, willDecelerate: decelerate)
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        head.scrollViewWillBeginDragging(scrollView)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

