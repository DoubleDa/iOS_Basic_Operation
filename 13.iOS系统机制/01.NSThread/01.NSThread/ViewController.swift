//
//  ViewController.swift
//  01.NSThread
//
//  Created by 游义男 on 15/9/3.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var test = SwiftThreadTest()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        test.testNSThread()
        sleep(2)
        test.testGCDThread()
        test.testNSOperationQueue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


