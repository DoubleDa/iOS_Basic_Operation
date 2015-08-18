//
//  ViewController.swift
//  UIStepperDemo
//
//  Created by 游义男 on 15/8/12.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var stepper1: UIStepper!
    @IBOutlet var textField: UITextField!
    @IBAction func TappedValueChangedStepper(sender: UIStepper) {
        //转换为String
        textField.text = NSString(format: "%g", sender.value) as! String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //将初始值呈现
        textField.text = NSString(format: "%g", stepper1.value) as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

