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
        
        //define notification center
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "TestShape:", name: "actionOne", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"TestMessage:", name: "actionTwo", object: nil)
        
        //定义一个触发Notification的程序
        let dateComp: NSDateComponents  = NSDateComponents()
        
        dateComp.year = 2014
        
        dateComp.month = 09
        
        dateComp.day = 09
        
        dateComp.hour = 11
        
        dateComp.minute = 11
        
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        
        
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        
        let date: NSDate = calendar.dateFromComponents(dateComp)!
        
        
        
        
        
        //define Location notification
        
        let notification: UILocalNotification = UILocalNotification()
        
        notification.category = "FIRST_CATEGORY";
        
        notification.alertBody = "This is a notification"
        
        notification.fireDate = date
        
        
        
        //fire notification
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    
    
    func TestShape(notification: NSNotification) {
        
        var view = UIView(frame: CGRectMake(100,100,100,100));
        
        view.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(view)
        
    }
    
    
    
    func TestMessage(notification: NSNotification) {
        
        var message: UIAlertController = UIAlertController(title: "Notification Message", message: "Hello, this is an alert message", preferredStyle: UIAlertControllerStyle.Alert)
        
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        
        
        self.presentViewController(message, animated: true, completion: nil)
        
    }
    

        
    
//    override func viewDidAppear(animated: Bool) {
//        // 创建静态的通知名字串
//        let notificationName :String = "PostArticleSuccessNotification"
//        
//        //然后，使用通知中心来Post通知 （2种方式, 方法） pattern1
//        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: "Object", userInfo: ["statu":"success"])
//        
//        // pattern2
//        let notification = NSNotification(name: notificationName, object: "Object", userInfo: ["status" : "success"])
//        NSNotificationCenter.defaultCenter().postNotification(notification)
//        
//        /**
//        *  使某一个对象成为监听者
//        */
//        // pattern1
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "NotificationAction:", name: notificationName, object: nil)
//        //pattern2
//        NSNotificationCenter.defaultCenter().addObserverForName(notificationName, object: self, queue: NSOperationQueue.mainQueue()) { (note) -> Void in
//            print(note.name)
//            print(note.object)
//            print(note.userInfo)
//        }
//        
//        // 是根据NotificationName来移除指定的一个通知监听者的 ,若没有参数则全部移除
////        NSNotificationCenter.defaultCenter().removeObserver(self, name: notificationName, object: nil)
//    }

    
//
//    func NotificationAction(note:NSNotification){
//        print(note.name)
//        print(note.object)
//        print(note.userInfo)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

