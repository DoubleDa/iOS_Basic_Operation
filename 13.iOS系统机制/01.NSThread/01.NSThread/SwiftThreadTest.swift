//
//  SwiftThreadTest.swift
//  01.NSThread
//
//  Created by 游义男 on 15/9/3.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class SwiftThreadTest:UIViewController {
    
    var queue = NSOperationQueue()
    
    //    init()
    //    {
    //        //alloc
    //        super.init()
    //    }
    
    deinit{
    //dealloc
        }
    
    /**
    (二) GCD
    */
    func testGCDThread(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //这里写需要大量时间的代码(循环、递归花费时间)
            for var i = 0; i < 100000; i++ {
                print("GCD thread running.")
            }
            
            sleep(5) // 调用sleep方法等待同步锁
            
            dispatch_async(dispatch_get_main_queue(), {
                //这里返回主线程，写需要主线程执行的代码
                print("这里返回主线程，写需要主线程执行的代码")
            })
        })
    }
    
    /**
    // 上述2种创建线程方式的优缺点
    - 优点：简单快捷
    - 缺点：无法对线程进行更详细的设置
    */
    func testNSThread(){
        // 1.创建线程后自动启动：
        //        NSThread.detachNewThreadSelector("threadInMainMethod", toTarget: self, withObject: nil)
        // 隐私创建并启动线程
        //        NSThread.performSelectorInBackground("threadInMainMethod", withObject: nil)
        
        // 2. 先创建，后启动 如果可变 var
        // Note: selector中的冒号一定不能少，不能少
        var myThread = NSThread(target: self, selector: "threadInMainMethod:", object: nil)
        myThread.start()
        
        //        myThread.isMainThread  // Bool 是否为主线程
        //        myThread = NSThread.mainThread() // 返回主线程
    }
    
    func threadInMainMethod(sender : AnyObject){
        for var i = 0; i < 100000; i++ {
            print("NSThread running.")
        }
    
        sleep(5);
        print("NSThread over.")
    }
    
    func testNSOperationQueue(){
        //func (op: NSOperation!)
        var mopt = myOperationThread()
        queue.addOperation(mopt)
        }
    }
    



class myOperationThread : NSOperation{
        override func start(){
            super.start()
        }
        
        override func main(){
            for var i = 0; i < 100000; i++
            {
                print("NSOperation running.")
            }
            print("NSOperation over.")
        }
}

