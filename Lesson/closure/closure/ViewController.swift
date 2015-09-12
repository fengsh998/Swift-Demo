//
//  ViewController.swift
//  closure
//
//  Created by fengsh on 4/9/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var retclosure : ((Int,Int) -> Int)?
    //初始化一个闭包类型变量
    //var c : (Int,Int) -> Int = {(a,b) -> Int in return a + b}
    
    var cl : ((a:String,value:Int, aObj : SwiftClosureA!) ->(String))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //testA()
        
        //testB()
        
        //testC()
    }
    
    //测试返回闭包
    func testA()
    {
        var closure : SwiftClosureA? = SwiftClosureA()
        
        //正常调用时写法
        closure!.apendString("hello",bstr: "world!", closure: {(a, b) -> () in
            print(a + b)
        })
        
        //尾随闭包的简单写法
        closure!.apendString("hello",bstr: "world!") { (a, b) -> () in
            print(a + b)
        }
        
        //实质返回的为类成员函数此时将捕获持有closure实例。
        retclosure = closure!.returnClosure()
        
        closure = nil
        
        let ret = retclosure!(10,20)
        
        print(ret)
        //只有当成员函数释放时才释放。
        retclosure = nil
    }
    
    //测试捕捉
    func testB()
    {
        var closure : SwiftClosureA? = SwiftClosureA()
        let ok = "returnClosureString" //参数将会被捕获
        let retclosure = closure?.returnClosureString(ok)
        
        cl = retclosure
        
        var ret = retclosure!(a:"函数:",value:10,aObj:closure)
        
        print(ret)
        closure = nil
        
        ret = retclosure!(a:"函数:",value:20,aObj:closure)
        print(ret)

    }
    
    //测试循环引用
    func testC()
    {
        var cb : SwiftClosureB! = SwiftClosureB()
        
        cb.getNetImage()
 
        cb = nil
    }

    @IBAction func onCall(sender: AnyObject)
    {
        print(cl!(a:"函数:",value:20,aObj:nil))
    }
    
    @IBAction func onReturn(sender: AnyObject)
    {
        testA()
    }
    
    @IBAction func onReference(sender: AnyObject)
    {
        testC()
    }
    
    @IBAction func onSettings(sender: AnyObject)
    {
        testB()
    }
    
    @IBAction func onClassReference(sender: AnyObject)
    {
        
        var aInstance : Aclass! = Aclass()
        var bInstance : Bclass! = Bclass()
        //B实例引用A实例
        bInstance.obja = aInstance
        aInstance.objb = bInstance
        
        aInstance = nil
        bInstance = nil
        
        
        /*
        var aclass : Aclass! = Aclass()
        var bclass : Bclass! = Bclass()
        
        aclass.weakobjb = bclass
        bclass.obja = aclass
        
        aclass = nil
        bclass = nil
        */
        
        /* crash
        let aclass : Aclass! = Aclass()
        print(aclass.unownedobjb)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

