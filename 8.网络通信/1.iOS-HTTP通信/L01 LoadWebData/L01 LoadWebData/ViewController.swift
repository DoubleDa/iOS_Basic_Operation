//
//  ViewController.swift
//  L01 LoadWebData
//
//  Created by 游义男 on 15/6/7.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       //动过字符串加载http协议页面信息 NSURL
        var str = NSString(contentsOfURL: NSURL(string: "http://www.baidu.com")!, encoding: NSUTF8StringEncoding, error: nil)
//  通过file
//        var dtr = NSString(contentsOfFile: NSString(string: ""), encoding: NSUTF8StringEncoding, error: nil)
        
        
        //print binary code
        var data = NSData(contentsOfURL: NSURL(string: "http://www.baidu.com")!)
        //convert binary to String 
        println(NSString(data: data!, encoding: NSUTF8StringEncoding))
        
        //同步操作，卡死 以上主要应用于读取本地信息
        
        var response:NSURLResponse?
        var error:NSError?
        
        
        var conn = NSURLConnection.sendSynchronousRequest(NSURLRequest(URL: NSURL(string: "http://www.baidu.com")!), returningResponse: &response , error: &error)
        
        
        if let d = conn{
            println(NSString(data: d, encoding: NSUTF8StringEncoding))
        }
        if let r = response{
            println(r)
        }
        if let e = error{
            println(e)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

