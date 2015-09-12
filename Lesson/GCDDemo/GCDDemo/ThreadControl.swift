//
//  ThreadControl.swift
//  GCDDemo
//
//  Created by fengsh on 27/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import Foundation

class ThreadOperation {
    
    private var _tid:AnyObject! = nil;
    
    private var _cancel : Bool = false
    private var _supend : Bool = false
    
    var isCancel : Bool {
        get{
            return _cancel
        }
    }
    
    var tid : AnyObject! {
        get {
            return _tid
        }
    }
    
    //上下文
    var userinfo : AnyObject? = nil;
    
    init(id:AnyObject!)
    {
        print("opation \(id) init.")
        _tid = id
    }
    
    func execture()
    {
        print("no params exec")
    }
    
    func execture(main:(()->())?)
    {
        if let hasmain = main
        {
            hasmain()
        }
        else
        {
            execture()
        }
    }
    
    func cancel()
    {
        _cancel = true
    }
    
    func supend()
    {
        _supend = true
    }
    
    func resume()
    {
        _supend = false
    }
    
    deinit
    {
        print("operation \(_tid) free.")
    }
}

class ThreadOperationQueue
{
    init()
    {
        
    }
    private var thread : Array<ThreadOperation> = Array()
    
    private let conqueue = dispatch_queue_create("com.fsh.ThreadOperationQueue.con", DISPATCH_QUEUE_CONCURRENT)
    
    private let signal = dispatch_semaphore_create(1);
    //默认为5个最大并发数
    var maxConcurrentCount : Int = 5;
    
    func addOperation(operation:ThreadOperation)
    {
        dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
        
        
    }
    
    deinit
    {
        
    }
}

