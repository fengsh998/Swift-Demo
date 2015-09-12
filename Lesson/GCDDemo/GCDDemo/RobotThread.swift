//
//  RobotThread.swift
//  GCDDemo
//
//  Created by fengsh on 20/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//
//队列，线程同步，并发控制，

//FIFO

//同步方式：锁，@syncronized(平果) lock,unlock.(信号量同步，互斥锁，临界锁) PC夸进程通信

import Foundation

// ABC三个线程，A 3秒，B 5秒完成 C,7少完成。 先完成的将值插入数组。但现在要必须是先按BCA的顺序来插入值

class Robot
{
    var result:Array<String>! = nil
    
    //当信号量 > 0时执行
    let semaphoreB = dispatch_semaphore_create(0);
    let semaphoreC = dispatch_semaphore_create(0);
    //let finish      = dispatch_semaphore_create(0);
    
    var st = 0.0
    var ed = 0.0
    
    let _name : String!
    init(name:String)
    {
        
        _name = name
        result = Array<String>()
        print("机器人[" + _name + "]准备就绪.")
    }
    
    //*******************************采用信号量的方式进行同步*********************************
    func running()
    {
        st = CFAbsoluteTimeGetCurrent()
        doAthread()
        doBthread()
        doCthread()
        //dispatch_semaphore_wait(finish, DISPATCH_TIME_FOREVER);
    }
    
    func accept()
    {
        print("accept")
    }
    
    func doAthread()
    {
        let queue = dispatch_queue_create("concurrent_queueA", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            //等C信号 不能放在主线程里，会阻塞
            dispatch_semaphore_wait(self.semaphoreC, DISPATCH_TIME_FOREVER);
            self.result.append("A ok.\(time)");
            
            //dispatch_semaphore_signal(self.finish);
        }
    }
    
    func doBthread()
    {
        let queue = dispatch_queue_create("concurrent_queueB", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue) { () -> Void in
        
            let time = arc4random() % 10
            sleep(time)
            //等C信号
            self.result.append("B ok. \(time)")
            
            dispatch_semaphore_signal(self.semaphoreB);
        }
    }
    
    func doCthread()
    {
        let queue = dispatch_queue_create("concurrent_queueC", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            //等B信号
            dispatch_semaphore_wait(self.semaphoreB, DISPATCH_TIME_FOREVER);
            self.result.append("C ok.\(time)");
            
            dispatch_semaphore_signal(self.semaphoreC);
        }
    }
    
    //*******************************采用串行队列或并发队列*********************************
    func running2(concurrent:Bool)
    {
        st = CFAbsoluteTimeGetCurrent()
        var queue :dispatch_queue_t! = nil
        if concurrent
        {
            //使用并发队列(但不能保证按B,C,A)输出
            queue = dispatch_queue_create("con_queue", DISPATCH_QUEUE_CONCURRENT)
        }
        else
        {
            //保证了B,C,A输出但效率低
            queue = dispatch_queue_create("fifo_queue", DISPATCH_QUEUE_SERIAL)
        }
        
        let group = dispatch_group_create()
        
        dispatch_group_async(group, queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            self.result.append("B ok. \(time)") //
        }
        
        dispatch_group_async(group, queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            self.result.append("C ok.\(time)");
        }
        
        dispatch_group_async(group, queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            self.result.append("A ok.\(time)");
        }
        
        dispatch_group_notify(group, queue) { () -> Void in
            print("B,C,A finish . \(self._name) ")
            //print("B,C,A finish . ")
        }
        
        dispatch_async(queue) { () -> Void in
            dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        }
    }
    
    //*******************************采用异步阻障的方式*********************************
    //与runing2采用串行队列的交果是一个样的
    func running3()
    {
        st = CFAbsoluteTimeGetCurrent()
        //创建并发队列
        let queue = dispatch_queue_create("con_queue", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_barrier_async(queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            self.result.append("B ok.\(time)");
        }
        print("ok 1")
        dispatch_barrier_async(queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            self.result.append("C ok.\(time)");
        }
        print("ok 2")
        dispatch_barrier_async(queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            self.result.append("A ok.\(time)");
        }
        print("ok 3")
    }
    
    deinit
    {
        ed = CFAbsoluteTimeGetCurrent()
        print(self.result)
        print("机器人[" + _name + "]罢工. 工作时长 : \(ed - st)")
    }
}


class Robot2
{
    var result:Array<String>! = nil
    
    //当信号量 > 0时执行
    var semaphoreB = dispatch_semaphore_create(5);

    var st = 0.0
    var ed = 0.0
    
    let _name : String!
    init(name:String)
    {
        
        _name = name
        result = Array<String>()
        print("机器人[" + _name + "]准备就绪.")
    }
    
    //*******************************采用信号量的方式进行同步*********************************
    func running()
    {
        st = CFAbsoluteTimeGetCurrent()
        doAthread()
        doBthread()
        doCthread()

    }
    
    func doAthread()
    {
        let queue = dispatch_queue_create("concurrent_queueA", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            //等C信号 不能放在主线程里，会阻塞
            dispatch_semaphore_wait(self.semaphoreB, DISPATCH_TIME_FOREVER);
            self.result.append("A ok.\(time)");
            
            dispatch_semaphore_signal(self.semaphoreB);
        }
    }
    
    func doBthread()
    {
        let queue = dispatch_queue_create("concurrent_queueB", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue) { () -> Void in
            
            let time = arc4random() % 10
            sleep(time)
            //等C信号
            self.result.append("B ok. \(time)")
            
            dispatch_semaphore_signal(self.semaphoreB);
            dispatch_semaphore_signal(self.semaphoreB);
        }
    }
    
    func doCthread()
    {
        let queue = dispatch_queue_create("concurrent_queueC", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue) { () -> Void in
            let time = arc4random() % 10
            sleep(time)
            //等B信号
            dispatch_semaphore_wait(self.semaphoreB, DISPATCH_TIME_FOREVER);
            self.result.append("C ok.\(time)");
            
            dispatch_semaphore_signal(self.semaphoreB);
        }
    }
    
    func doSignalValueTest()
    {
        var count = 1
        let lk = NSLock()
        let queue = dispatch_queue_create("concurrent_queueA", DISPATCH_QUEUE_CONCURRENT)
        for (var i=0; i<100; i++)
        {
            dispatch_async(queue) { () -> Void in
                
                dispatch_semaphore_wait(self.semaphoreB, DISPATCH_TIME_FOREVER);
               
                
                lk.lock()
                print("i  = \(count++) 正在做。。。")
                
                if count > 15
                {
                    //过程中修改是很危险的
                    self.semaphoreB = dispatch_semaphore_create(2)
                }
                lk.unlock()
                //let time = arc4random() % 10
                //sleep(time)
                
                sleep(5)
                
                dispatch_semaphore_signal(self.semaphoreB);
            }
        }
    }
    

    deinit
    {
        ed = CFAbsoluteTimeGetCurrent()
        print("机器人[" + _name + "]罢工. 工作时长 : \(ed - st)")
    }
}




