//
//  closureType.swift
//  closure
//
//  Created by fengsh on 4/9/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import Foundation

/***************************声明为类型***************************/

//声明一个闭包。该闭包不需要入参也不需要反回值
typealias NoParamsNoReturnClosure = () -> ()
//有入参，但无返回的闭包
typealias ParamsNoReturnClosure = (String ,String) -> ()
//有入参且有返回值的闭包
typealias ParamsReturnClosure = (Int , Int) -> Int //返回值可加()也可不加
//有入参且返回一个函数的闭包
typealias ParamsReturnFunClosure = (Int , Int) -> (String) -> (String)

class SwiftClosureA
{
    var _name : String?
    
    init()
    {
        print("SwiftClosure A init.");
        _name = "closure A"
    }
    
    deinit
    {
        print("SwiftClosure A free.")
    }
    
     var name : String {
        get{
             return _name!
        }
        set(aName) {
            _name = aName
        }
    }
    
    //计算属性
    lazy var getProperty : () -> String = {
        let s = self.name  //产生了循环引用
        return s + " is call."
    }
    
    //传参(同时这也是一个尾随闭包)
    func apendString(astr:String,bstr:String,closure : ParamsNoReturnClosure)
    {
        let a = "字串A : " + astr
        let b = "字串B : " + bstr
        
        closure(a,b)
    }
    
    //乘法 (类成员函数)
    private func multi(a : Int, b : Int) -> Int
    {        
        return a * b
    }
    
    //返回乘法运算的闭包
    func returnClosure() -> (Int , Int) -> Int
    {
         return multi
    }
    
    //捕获上下文中的变量
    func returnClosureString(param:String) -> (a:String,value:Int, aObj : SwiftClosureA!) ->(String)
    {
        let c = 50 //变量50被捕获，同时param被捕获
        //self.name = "引用name" //值类型
        func returnstring(a:String,value:Int, aObj : SwiftClosureA!) -> String
        {
            return a + param + " \(c) + \(value) = \(c + value)" + " 实例 : \(aObj)" //+ self.name
        }
        
        return returnstring
    }
}

//闭包引用自身产生的循环引用
class SwiftClosureB
{
    private var state : Int = 0
    
    var img : AnyObject? = nil
    
    var saveToFile : ((AnyObject) -> ())?

    //使用延迟属性注意产生循环引用
    lazy var currentState : () -> Int = {
        [unowned self] in
        return self.state
    }
    
    init()
    {
        print("SwiftClosure B init.")
    }

    func getNetImage()
    {
        //闭包的定义中引用self
        saveToFile = { /*[unowned self]*/[weak self] (img) -> () in
            
            //在这里引用了自身
            self!.img = img
            //to do save to file
        }
        
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("正在请求网络...")
            sleep(4)
            print("获取图片成功")
            
            //闭包执行
            self.saveToFile!("图片流")
        }
    }
    
    deinit
    {
        print("SwiftClosure B free.")
    }
    
}
