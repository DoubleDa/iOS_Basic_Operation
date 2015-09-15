//
//  ViewController.swift
//  NSNotificationTest
//
//  Created by 游义男 on 15/9/15.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    override func viewDidAppear(animated: Bool) {
        // 创建静态的通知名字串
        let notificationName :String = "PostArticleSuccessNotification"
        
        //然后，使用通知中心来Post通知 （2种方式, 方法） pattern1
        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: "Object", userInfo: ["statu":"success"])
        
        // pattern2
        let notification = NSNotification(name: notificationName, object: "Object", userInfo: ["status" : "success"])
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
        /**
        *  使某一个对象成为监听者
        */
        // pattern1
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "NotificationAction:", name: notificationName, object: nil)
        //pattern2
        NSNotificationCenter.defaultCenter().addObserverForName(notificationName, object: self, queue: NSOperationQueue.mainQueue()) { (note) -> Void in
            print(note.name)
            print(note.object)
            print(note.userInfo)
        }
        
        // 是根据NotificationName来移除指定的一个通知监听者的 ,若没有参数则全部移除
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: notificationName, object: nil)
    }

    func NotificationAction(note:NSNotification){
        print(note.name)
        print(note.object)
        print(note.userInfo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

