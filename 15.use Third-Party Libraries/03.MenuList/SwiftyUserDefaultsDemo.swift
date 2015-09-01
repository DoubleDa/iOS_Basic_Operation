//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by xlx on 15/8/26.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        var age = Defaults["age"].string
//        println("age:\(age)")
//        
//        var ageValue = Defaults["ageValue"].stringValue
//        println("ageValue:\(ageValue)")
//        
//        Defaults["username"] = "StrongX"
//        var username = Defaults["username"].stringValue
//        println("usernmae:\(username)")
//        
//        Defaults["age"] = 18
//        Defaults["age"]++
//        println(Defaults["age"].intValue)
//        
//        
//        if Defaults.hasKey("username") {
//            println("has username key")
//        }else{
//            println("don't have username key")
//        }
//        
//        
//        if Defaults.hasKey("name") {
//            println("has name key")
//        }else{
//            println("don't have name key")
//        }
//        
//        Defaults.remove("username")
//        
//        
//        if Defaults.hasKey("username") {
//            println("has username key")
//        }else{
//            println("don't have username key")
//        }
        
        
        Defaults["username"] ?= "StrongX"
        
        println(Defaults["username"].stringValue)
        
        Defaults["username"] ?= "Strong"
        
        println(Defaults["username"].stringValue)
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
