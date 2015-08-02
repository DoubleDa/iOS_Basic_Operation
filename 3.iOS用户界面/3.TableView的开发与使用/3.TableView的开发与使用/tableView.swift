//
//  tableView.swift
//  3.TableView的开发与使用
//
//  Created by 游义男 on 15/8/2.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class tableView: UITableView ,UITableViewDataSource,UITableViewDelegate{

    let TABLECELL_LABEL_TAG = 2
    let cellDataArray = ["Hello","iOS","Swift"]
    var data:NSDictionary!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        data = NSDictionary(contentsOfURL: NSBundle.mainBundle().URLForResource("data", withExtension: "plist")!)!
        //一定不能忘记，切记切记！！！
        self.dataSource = self
        self.delegate = self
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\((data.allValues[indexPath.section] as! NSArray).objectAtIndex(indexPath.row)) has been clicked")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //section 是一个索引
        return (data.allValues[section] as! NSArray).count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCellWithIdentifier("tableViewCell") as! UITableViewCell
        var label = cell1.viewWithTag(TABLECELL_LABEL_TAG) as! UILabel
//        label.text = cellDataArray[indexPath.row]
        label.text = (data.allValues[indexPath.section] as! NSArray).objectAtIndex(indexPath.row) as? String
        return cell1
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data.allKeys[section] as? String
    }
}
