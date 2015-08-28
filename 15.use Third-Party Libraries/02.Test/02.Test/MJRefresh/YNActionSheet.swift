//
//  YNActionSheet.swift
//  02.Test
//
//  Created by 游义男 on 15/8/29.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class YNActionSheet: UIViewController {

    var layerView:UIView!
    var width:CGFloat!
    var height:CGFloat!
    var CancelButton:UIButton!
    var btnArray = [UIButton]()
    
    let buttonHeight:CGFloat = 40
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //UIViewController 中必须实现的方法
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.height = self.view.bounds.size.height
        self.width = self.view.bounds.size.width
        self.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        
        self.view.backgroundColor = UIColor.clearColor()
        var tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
    }
    
    /**
    下拉菜单消失
    */
    func tap(){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCancelButtonWithTitle(title:String){
        if layerView == nil {
            layerView = UIView(frame: CGRect(x: width*0.1, y:self.height-((CGFloat)(btnArray.count)*self.buttonHeight + self.buttonHeight+30), width: width*0.8, height: (CGFloat)(btnArray.count)*self.buttonHeight+self.buttonHeight + 20 ))
            layerView.layer.cornerRadius = 5
            layerView.layer.masksToBounds = true
            layerView.alpha = 0.8
            self.layerView.addSubview(layerView)
        }else{
            var nowHeight = self.layerView.bounds.size.height
            nowHeight += 50
            layerView.frame = CGRect(x: width * 0.1, y: height - nowHeight, width: width*0.8, height: nowHeight)
        }
        if CancelButton == nil {
            CancelButton = UIButton(frame: CGRect(x: (CGFloat)(0), y: (CGFloat)(buttonHeight * (CGFloat)(btnArray.count)+10), width: width*0.8, height: buttonHeight))
            CancelButton.setTitle(title, forState: UIControlState.Normal)
            CancelButton.layer.cornerRadius = 5
            CancelButton.layer.masksToBounds = true
            CancelButton.backgroundColor = UIColor.brownColor()
            CancelButton.addTarget(self, action: "tap", forControlEvents: .TouchUpInside)
            self.layerView.addSubview(CancelButton)
        }
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
