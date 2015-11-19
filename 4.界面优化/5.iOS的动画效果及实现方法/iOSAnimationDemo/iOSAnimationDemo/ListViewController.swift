//
//  ListViewController.swift
//  iOSAnimationDemo
//
//  Created by 游义男 on 15/11/19.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var redSquareView:UIView = UIView(frame: CGRect(x: 20, y: 100, width: 50, height: 50))


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        redSquareView.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.75)
        self.view.addSubview(redSquareView)

    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.redSquareView.backgroundColor = UIColor.magentaColor().colorWithAlphaComponent(0.75)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
