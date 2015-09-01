//
//  POPViewController.swift
//  03.MenuList
//
//  Created by 游义男 on 15/9/1.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class POPViewController: UIViewController {
    
    var redDiamonds:UIView!
    var label:UILabel!
    
    @IBAction func basic(sender: AnyObject) {
        var basicPop = POPBasicAnimation(propertyNamed: kPOPLayerPositionX)
        basicPop.fromValue = 20
        basicPop.toValue = 200
        basicPop.duration = 1
        basicPop.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn )
        self.redDiamonds.pop_addAnimation(basicPop, forKey: "")
    }
    @IBAction func spring(sender: AnyObject) {
        var springPop = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        springPop.toValue = 200
        springPop.fromValue = 20
        springPop.springSpeed = 18
        springPop.springBounciness = 18
        
        springPop.dynamicsTension = 10
        springPop.dynamicsMass = 10
        springPop.dynamicsFriction = 10
        self.redDiamonds.pop_addAnimation(springPop, forKey: "")
    }
    @IBAction func decay(sender: AnyObject) {
        var decayPop = POPDecayAnimation(propertyNamed: kPOPLayerPositionY)
        decayPop.velocity = 600
//        decayPop.beginTime = CACurrentMediaTime() + 1
        self.redDiamonds.pop_addAnimation(decayPop, forKey: "YouYinan")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redDiamonds = UIView(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
        redDiamonds.center.x = self.view.center.x
        redDiamonds.backgroundColor = UIColor.redColor()
        self.view.addSubview(redDiamonds)
        
        label = UILabel(frame: CGRect(x: 10, y: 200, width: 300, height: 50))
        label.text = "0:0:0"
        label.font = UIFont.systemFontOfSize(30)
        label.textAlignment = .Center
        self.view.addSubview(label)
        
        var pop = POPMutableAnimatableProperty()
        pop.writeBlock = ({ (var obj:AnyObject!,var values:UnsafePointer<CGFloat>) ->Void in
            var label = obj as! UILabel
            var minute = values[0]/60
            var second = values[0]%60
            var ms = values[0]*100 % 60
            label.text = "\(Int(minute)):\(Int(second)):\(Int(ms))"
            })
        var basicPop = POPBasicAnimation.linearAnimation()
        basicPop.property = pop
        basicPop.fromValue = 0
        basicPop.toValue = 180
        basicPop.duration = 180
        basicPop.beginTime = CACurrentMediaTime() + 1
        
        label.pop_addAnimation(basicPop, forKey: "自定义动画")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
