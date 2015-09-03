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
    
    deinit
    {
    //dealloc
    }
    
    func testGCDThread()
    {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
    
    //这里写需要大量时间的代码
    
    for var i = 0; i < 100000; i++
    {
    print("GCD thread running.")
    }
    
    sleep(5);
    
    dispatch_async(dispatch_get_main_queue(), {
    
    //这里返回主线程，写需要主线程执行的代码
    print("这里返回主线程，写需要主线程执行的代码")
    })
    })
    }
    
    func testNSThread()
    {
    //方式一
    //NSThread.detachNewThreadSelector("threadInMainMethod:",toTarget:self,withObject:nil)
    
    //方式二
    var myThread = NSThread(target:self,selector:"threadInMainMethod:",object:nil)
    myThread.start()
    
    }
    
    func threadInMainMethod(sender : AnyObject)
    {
    for var i = 0; i < 100000; i++
    {
    print("NSThread running.")
    }
    
    sleep(5);
    print("NSThread over.")
    }
    
    func testNSOperationQueue()
    {
    //func (op: NSOperation!)
    var mopt = myOperationThread()
    queue.addOperation(mopt)
    }
    }
    
    
    class myOperationThread : NSOperation
    {
        override func start()
        {
            super.start()
        }
        
        override func main()
        {
            for var i = 0; i < 100000; i++
            {
                print("NSOperation running.")
            }
            print("NSOperation over.")
        }
}

