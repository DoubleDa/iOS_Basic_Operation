//
//  Singleton.swift
//  2.单例模式_线程安全
//
//  Created by 游义男 on 15/9/5.
//  Copyright © 2015年 游义男. All rights reserved.
//

import Foundation

class Singleton {
    class func shareInstance()->Singleton{
        struct YRSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:Singleton? = nil
        }
        dispatch_once(&YRSingleton.predicate) { () -> Void in
            YRSingleton.instance = Singleton()
        }
        return YRSingleton.instance!
    }
    
    //对于单例类，需要一个唯一的对外输出实例的shareInstance方法，而通过官方文档的查阅，发现对于class来说，静态方法可以用class func 来标示，静态变量使用class var来处理，但这里我借助了内部struct的静态变量来对唯一的instance进行存储
}

struct structSingleton {
    static func shareInstance()->structSingleton{
        struct YRSingleton{
        static var predicate:dispatch_once_t = 0
        static var instance:structSingleton? = nil
        }
        dispatch_once(&YRSingleton.predicate) { () -> Void in
            YRSingleton.instance = structSingleton()
        }
        return YRSingleton.instance!
    }
}
