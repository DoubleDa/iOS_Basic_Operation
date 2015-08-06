//
//  ViewController.swift
//  ActionSheet
//
//  Created by 游义男 on 15/8/3.
//  Copyright (c) 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIActionSheetDelegate,UIAlertViewDelegate{

    @IBOutlet weak var animateImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    //出现模态窗体，当前没有执行，后续就执行不了
    @IBAction func TappedAlertViewBtn(sender: UIButton) {
        
        var alertView =  UIAlertView(title: "确认关闭", message: "是否关闭当前窗体", delegate: self, cancelButtonTitle: "确认",otherButtonTitles:"Cancel","11","111")
        alertView.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        alertView.show()
    }
    // alertView 警告确认弹出框，ActionSheet可选操作列表(分享到微博，微信，。。)
    @IBAction func TappedActionSheetBtn(sender: AnyObject) {
        //默认从下往上出现
          var actionSheet = UIActionSheet(title: "ActionSheet", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "OK")
        // 显示其他更多选项
//        UIActionSheet(title: <#String?#>, delegate: <#UIActionSheetDelegate?#>, cancelButtonTitle: <#String?#>, destructiveButtonTitle: <#String?#>, otherButtonTitles: <#String#>, <#moreButtonTitles: String#>...)
        actionSheet.actionSheetStyle = UIActionSheetStyle.BlackOpaque
        
        actionSheet.showInView(self.view)
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        var inputValue = alertView.textFieldAtIndex(buttonIndex)?.text
        UIAlertView(title: "Value", message: "Value is: \(inputValue!) ", delegate: nil, cancelButtonTitle: "OK",otherButtonTitles:"Cancel","11","111").show()
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        UIAlertView(title: "你点击了", message: "你点击了Button: \(buttonIndex)", delegate: nil, cancelButtonTitle: "Cancel").show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(data:NSData(contentsOfURL: NSURL(string: "http://pic1.ooopic.com/uploadfilepic/sheji/2009-08-09/OOOPIC_SHIJUNHONG_20090809ad6104071d324dda.jpg")!)!)
        
        animateImageView.animationImages = [UIImage(named: "image1")!,UIImage(named: "image2")!,UIImage(named: "image3")!,UIImage(named: "image4")!,UIImage(named: "image5")!,UIImage(named: "image6")!]
        animateImageView.animationRepeatCount = 100
        animateImageView.animationDuration = 3
        animateImageView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }


}

