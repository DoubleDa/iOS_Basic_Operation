//
//  ViewController.swift
//  L02 AsyncLoadWebData
//
//  Created by 游义男 on 15/6/7.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: "http://www.baidu.com")!), queue: NSOperationQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            if let e = error{
                println("error!")
            }else{
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

