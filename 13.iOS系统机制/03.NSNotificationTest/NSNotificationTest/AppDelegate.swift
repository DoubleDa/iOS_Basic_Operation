//
//  AppDelegate.swift
//  NSNotificationTest
//
//  Created by 游义男 on 15/9/15.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        if identifier == "FIRST_ACTION" {
            
            NSNotificationCenter.defaultCenter().postNotificationName("actionOne", object: nil)
            
        }
        
        else if identifier == "SECOND_ACTION" {
            
            NSNotificationCenter.defaultCenter().postNotificationName("actionTwo", object: nil)
            
        }
        
        completionHandler()
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
//        let types = UIUserNotificationType.Alert    // //设置Notification 的类型
//        let mySettings = UIUserNotificationSettings(forTypes: types, categories: nil)   //设置Notification的设置项，其中categories参数用来设置Notification的类别
//        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)  //注册UserNotification
        
        //define Actions
        
        let firstAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction();
        
        // The unique identifier for this action
        
        firstAction.identifier = "FIRST_ACTION";
        
        // The localized title to display for this action
        
        firstAction.title = "First Action";
        
        //define action’s activationMode, // How the application should be activated in response to the action
        
        firstAction.activationMode = UIUserNotificationActivationMode.Background// 当点击的时候不启动程序，在后台处理
        
        //define action’s destructive // Whether this action should be indicated as destructive when displayed.
        
        firstAction.destructive = true
        
        //define authentication // Whether this action is secure and should require unlocking before being performed. If the activation mode is UIUserNotificationActivationModeForeground, then the action is considered secure and this property is ignored.
        
        firstAction.authenticationRequired = false//不需要用户解锁手机即可以处理该Notification
        
        
        
        var secondAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        
        secondAction.identifier = "SECOND_ACTION";
        
        secondAction.title = "Second Action";
        
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground
        
        secondAction.destructive = false
        
        secondAction.authenticationRequired = false
        
        
        
        var thirdAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        
        thirdAction.identifier = "THIRD_ACTION";
        
        thirdAction.title = "Third Action";
        
        thirdAction.activationMode = UIUserNotificationActivationMode.Background
        
        thirdAction.destructive = false
        
        thirdAction.authenticationRequired = false
        
        
        
        //Category
        
        let firstCategory: UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        
        firstCategory.identifier = "FIRST_CATEGORY";
        
        
        
        let defaultActions:NSArray = [firstAction, secondAction, thirdAction];
        
        let minimalActions:NSArray = [firstAction, secondAction];
        
        
        
        // Sets the UIUserNotificationActions in the order to be displayed for the specified context
        
        firstCategory.setActions(defaultActions as? [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Default);// // the default context of a notification action
        
        firstCategory.setActions(minimalActions as? [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Minimal);//Minimal // the context of a notification action when space is limited
        
        
        
        let categories: NSSet = NSSet(objects: firstCategory)
        
        
        
        
        
        //设置Notification 的类型
        
        let types:UIUserNotificationType = UIUserNotificationType.Alert
        //设置Notification的设置项，其中categories参数用来设置Notification的类别
        
        let mySettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: categories as? Set<UIUserNotificationCategory>);
        
        //注册UserNotification
        
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        
        return true
        
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

