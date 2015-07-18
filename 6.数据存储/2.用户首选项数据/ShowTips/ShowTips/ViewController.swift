//
//  ViewController.swift
//  ShowTips
//
//  Created by 游义男 on 15/4/28.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ud:NSUserDefaults!
    
    @IBOutlet weak var MySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ud = NSUserDefaults.standardUserDefaults()
        MySwitch.on = ud.boolForKey("showTips")
        
        if MySwitch.on{
            UIAlertView(title: "提示", message: "下雨要带雨伞啦啦啦啊啦啦", delegate: nil, cancelButtonTitle: "好的").show()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func valueChanged(sender: AnyObject) {
        ud.setBool(MySwitch.on, forKey: "showTips")
    }
}

