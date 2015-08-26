//
//  ViewController.swift
//  02.Test
//
//  Created by 游义男 on 15/8/26.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var dataArray = [String]()
    
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
        
        self.tableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "headerRefresh")
        self.tableView.addGifFooterWithRefreshingTarget(self, refreshingAction: "footerRefresh")
        
    }
    
    // 下拉刷新 覆盖
    func headerRefresh(){
        ProgressHUD.show("亲爱的，别急～～", interaction: true)
        self.delay(2, closure: { () -> () in
            self.dataArray.removeAll(keepCapacity: false)
            var i = 0
            for(i=0;i<10;i++){
                self.dataArray.append("\(i)")
            }
            self.tableView.header.endRefreshing()
            self.tableView.reloadData()
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
    
    func delay(time:Double,closure:() ->()){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = self.dataArray[indexPath.row]
        
        return cell
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

