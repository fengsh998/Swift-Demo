//
//  ResCompete.swift
//  GCDDemo
//
//  Created by fengsh on 22/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import Foundation

class Res {
    
    init()
    {
        print("Res init.")
    }
    
    deinit
    {
        print("Res free.")
    }
    
    let lock = dispatch_semaphore_create(1);

    func doReadRes(thread:String)
    {
        print("[" + thread + "]即将读取资源。")
        dispatch_semaphore_wait(self.lock, DISPATCH_TIME_FOREVER);
        print("[" + thread + "]已读取资源。")
    }
    
    func doFreeRes(thread:String)
    {
        print("[" + thread + "]释放放资源。")
        dispatch_semaphore_signal(self.lock);
    }
}

//资源竞争死锁
class ResCompete
{
    let res = Res()
    let lock = dispatch_semaphore_create(0);
    func doA()
    {
        let queueA = dispatch_queue_create("concurrent_queueA", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queueA) {() -> Void in
            self.res.doReadRes("线程A")
            let time = arc4random() % 10
            sleep(time)
            
//            dispatch_barrier_async(queueA, { () -> Void in
//                self.doB();
//                
//                //等待线程B做完
//                
//                self.res.doFreeRes("线程A释放")
//            })
            
            //self.res.doFreeRes("线程A释放")
            self.doB();
            
            dispatch_semaphore_wait(self.lock, DISPATCH_TIME_FOREVER);
            
            self.res.doFreeRes("线程A释放")
        }
    }
    
    func doB()
    {
        let queueB = dispatch_queue_create("concurrent_queueB", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queueB) { () -> Void in
            self.res.doReadRes("线程B")
            let time = arc4random() % 10
            sleep(time)
            self.res.doFreeRes("线程B释放")
            
            dispatch_semaphore_signal(self.lock);
        }
    }
    
    func dealLock()
    {
        doA()
        //doB()
    }
    
    init()
    {
        print("ResCompete init.")
    }
    
    deinit
    {
        print("ResCompete free.")
    }
}