//
//  ViewController.swift
//  UserDefault
//
//  Created by 游义男 on 15/4/28.
//  Copyright (c) 2015年 游义男. All rights reserved.
///Users/youyinan/Documents/SWIFT/Swift_exercise/2015-04-28/UserDefault/UserDefault/ViewController.swift

import UIKit

class ViewController: UIViewController {
    
    var ud:NSUserDefaults!
    
    @IBOutlet weak var inputTxt: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ud = NSUserDefaults.standardUserDefaults()
        //ud.objectForKey("data")
//        ud.setBool(value: Bool, forKey: String) 存储值
        if let value: AnyObject = ud.objectForKey("data"){
            inputTxt.text = value as! String
        }else{
            inputTxt.text = "No value"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //保存数据
    @IBAction func SaveTapped(sender: AnyObject) {

        ud.setObject(inputTxt.text, forKey: "data")
        println("saved")
    }

}

