//
//  GCDTest.swift
//  test
//
//  Created by 游义男 on 15/9/5.
//  Copyright © 2015年 游义男. All rights reserved.
//

import Foundation

class GCDTest{
    deinit{}
    
    // 1
    func testGCD(){
        let queue = dispatch_queue_create("edu.hhu.gcdTest", DISPATCH_QUEUE_CONCURRENT) // DISPATCH_QUEUE_SERIAL
        dispatch_async(queue) { () -> Void in
            print("在这里停两秒")
            sleep(2)
//            NSThread.sleepForTimeInterval(2)
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                print("返回主线程")
            })
        }
    }
    
    // 2延时调用 添加进队列的任务延时执行，比如想让一个Block在10秒后执行
    // dispatch_time用于计算相对时间，dispatch_walltime用于计算绝对时间
    func delay(){
        // delta 单位时ns
        let time = dispatch_time(DISPATCH_TIME_NOW, (Int64)(10 * NSEC_PER_SEC))
        print("在十秒后执行delay()")
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            print("现在正在执行delay()")
        }
    }
    
    // 3
    // group 我们现在有3个Block要执行，我们不在乎它们执行的顺序，我们只希望在这3个Block执行完之后再执行某个操作
    func group(){
        var group = dispatch_group_create()
        dispatch_group_async(group, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            print(1)
        }
        dispatch_group_async(group, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            print(2)
        }
        dispatch_group_async(group, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            print(3)
        }
        //        //最后执行完的通知
        //        dispatch_group_notify(dispatch_group_create(), dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
        //            print("completed")
        //        }
        // 使当前的线程处于等待的状态,如果在主线程执行，block执行后主线程会出现卡死状态 指定超时的时间(second parameter) 可以指定为具体的等待时间，根据dispatch_group_wait的返回值来判断是上面block执行完了还是等待超时了
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        print("completed")
    }
    
    // 4.barrier 避免在写文件时候正好有线程来读取
    /**
        如果添加dispatch_barrier_async的时候，其他的block（包括上面4个block）还没有开始执行，那么会先执行dispatch_barrier_async里的任务，其他block全部处于等待状态。如果添加dispatch_barrier_async的时候，已经有block在执行了，那么dispatch_barrier_async会等这些block执行完后再执行。
    */
    
    func barrier(){
        NSUserDefaults.standardUserDefaults().setInteger(7, forKey: "integer")
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            print("读取integer")
            NSUserDefaults.standardUserDefaults().integerForKey("integetr")
        }
        dispatch_barrier_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            NSUserDefaults.standardUserDefaults().setInteger(1, forKey: "integer")
        }
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            print("读取integer")
            NSUserDefaults.standardUserDefaults().integerForKey("integetr")
        }
    }
    
    //5.dispatch_apply dispatch_apply会将一个指定的block执行指定的次数
    // 由于是Concurrent Dispatch Queue，不能保证哪个索引的元素是先执行的，但是“completed”一定是在最后打印，因为dispatch_apply函数是同步的，执行过程中会使线程在此处等待，所以一般的，我们应该在一个异步线程里使用dispatch_apply函数
    func apply(){
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
                print("创建一个异步barrier线程")
                dispatch_apply(10, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), { (index) -> Void in
                    print(index)
                })
                print("completed")
        }
        print("在dispatch_apply之前")
    }
    
// 6.dispatch_suspend/dispatch_resume
    // dispatch_suspend(queue) 暂停
    // dispatch_resunme(queue) 恢复
    
    //7. Dispatch Semaphore
    
    //8. dispatch_once
    // dispatch_once函数通常用在单例模式上，它可以保证在程序运行期间某段代码只执行一次，如果我们要通过dispatch_once创建一个单例类
    
//    class SingletonObject {
//        class var sharedInstance : SingletonObject {
//            struct Static {
//                static var onceToken : dispatch_once_t = 0
//                static var instance : SingletonObject? = nil
//            }
//            dispatch_once(&Static.onceToken) {
//                Static.instance = SingletonObject()
//            }
//            return Static.instance!
//        }
//    }
}