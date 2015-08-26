//
//  ViewController.swift
//  2. MJRefresh 2015-08-24
//
//  Created by 游义男 on 15/8/25.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var tableView:UITableView!
    var objectArray = [String]()
    var i = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 设置tableView的大小
//        self.tableView = UITableView(frame: self.view.frame)
        self.tableView = UITableView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)!, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.Grouped)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.navigationController?.navigationBarHidden = true
        self.navigationItem.title = "MJRefresh"

        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
    
        
        for(i;i<10;i++){
            self.objectArray.append("\(i)")
        }


    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "这是第\(self.objectArray[indexPath.row]) 行"
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return (self.navigationController?.navigationBar.frame.height)! + 16
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

