//
//  Singleton_1.2.swift
//  2.单例模式_线程安全
//
//  Created by 游义男 on 15/9/6.
//  Copyright © 2015年 游义男. All rights reserved.
//

import Foundation

/**
    Class constant
*/
class Singleton_Swift {
    // 1.lazy initialization(lazily initializes class constants and variables)
    // 2. thread safe by the definition of let 
    // 3. class constants were instroduced in Swift 1.2.use the nested struct approach below or a global constant
    static let sharedInstance = Singleton_Swift()
}

/**
    Nested struct
*/
class Test {
    class var sharedInstance: Test {
        struct Static {
            static let instance:Test = Test()
        }
        return Static.instance
    }
}


/**
    dispatch_once
*/
//Here we are using the static constant of a nested struct as a class constant. This is a workaround for the lack of static class constants in Swift 1.1 and earlier, and still works as a workaround for the lack of static constants and variables in functions.
class Singleton_disptch{
    class var sharedInstance:Singleton_disptch {
        struct Static {
            static var onceToken:dispatch_once_t = 0
            static var instance:Singleton_disptch? = nil
        }
        dispatch_once(&Static.onceToken) { () -> Void in
            Static.instance = Singleton_disptch()
        }
        return Static.instance!
    }
}

/**
    static struct variables are initialized both lazy and wrapped in dispatch_once
    Apple has clarified that lazy initializer are thread-safe, so there's no need for dispatch_once or similar protections
*/
class withSingleton {
    class var sharedInstance:withSingleton {
        struct Singleton {
            static let instance = withSingleton()
        }
        return Singleton.instance
    }
}