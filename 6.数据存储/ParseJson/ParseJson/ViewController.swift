//
//  ViewController.swift
//  ParseJson
//
//  Created by 游义男 on 15/4/28.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //读取Json格式文件
        // Dispose of any resources that can be recreated.
       // var json:AnyObject? = NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("obj", ofType: "json")!)!)!, options: NSJSONReadingOptions.allZeros, error: nil)
        
        //if let lang: AnyObject = json?.objectForKey("language"){
          //  println(lang)}
        
        var dict = ["name":"jikexueyuan","age":1]
        var json = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.allZeros, error: nil)
        var str = NSString(data: json!, encoding: NSUTF8StringEncoding)
        println(str)
    }


}

