//
//  ViewController.swift
//  test
//
//  Created by 游义男 on 15/9/5.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var test = GCDTest()
        test.testGCD()
        test.delay()
        test.group()
        test.barrier()
        test.apply()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


