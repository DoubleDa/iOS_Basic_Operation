//
//  ViewController.swift
//  2.单例模式_线程安全
//
//  Created by 游义男 on 15/9/5.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var swiftInstance1 = Singleton.shareInstance()
        var swiftInstance2 = Singleton.shareInstance()
        if (swiftInstance1 === swiftInstance2){
            print("they are the same instance")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

