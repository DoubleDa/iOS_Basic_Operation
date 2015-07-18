//
//  ViewController.swift
//  JSON_Example
//
//  Created by 游义男 on 15/7/16.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var json: AnyObject? = NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("obj", ofType: "json")!)!)!, options: NSJSONReadingOptions.allZeros, error:nil)
//        
//        var lang: AnyObject? = json!.objectForKey("language")
//            println(lang!)
        
        var dict = ["name":"hhu","age":1]
        var jsonData = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.allZeros, error: nil)
        
        var str = NSString(data: jsonData!, encoding: NSUTF8StringEncoding)
        println(str!)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

