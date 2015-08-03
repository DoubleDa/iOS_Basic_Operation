//
//  ViewController.swift
//  UISegmentController
//
//  Created by 游义男 on 15/8/3.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func TappedRemoveBtn(sender: AnyObject) {

        segmentedControl.removeSegmentAtIndex(segmentedControl.selectedSegmentIndex, animated: true)
    }
    @IBAction func TappedAddBtn(sender:AnyObject){
        segmentedControl.insertSegmentWithTitle(TextField1.text, atIndex: segmentedControl.numberOfSegments, animated: true)
    }
    @IBOutlet weak var TextField1: UITextField!
    @IBAction func ValueChanged(sender: AnyObject) {
        switch sender.selectedSegmentIndex{
        case 0:
            self.view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        case 1:
            self.view.backgroundColor = UIColor.purpleColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        case 3:
            self.view.backgroundColor = UIColor.redColor()
        case 4:
            self.view.backgroundColor = UIColor.orangeColor()
        default:
            self.view.backgroundColor = UIColor.yellowColor()
        }
        NSLog("You Selected Index \(segmentedControl.selectedSegmentIndex)")
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

