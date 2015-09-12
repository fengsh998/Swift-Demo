//
//  OptionalSwift.swift
//  optionalType
//
//  Created by fengsh on 23/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import Foundation


class Company
{
    var companyName : String! = nil
    init(name:String)
    {
        print("[" + name + "] init.");
        companyName = name
    }
    
    func addDepartment(name : String)
    {
        print("[" + companyName + "] add a [" + name + "]department.")
    }

    deinit
    {
        print("[" + companyName + "] free.")
    }
}

class OptionalType
{
    //常量
    let constCompany : Company // 不能设置为nil,编译是不允许的
    //可选变量(不需要解包)
    var unwrapCompany : Company! = nil //可以不设置为nil
    //可选变量(封包)
    var wrapCompany : Company?
    
    var cp : AnyObject?
    
    init()
    {
        //print("OptionalType init.")
        constCompany    = Company(name:"Const")
        unwrapCompany   = Company(name:"Unwrap")
        wrapCompany     = Company(name: "wrap")
    }
    
    //过程中设置为nil
    func sometimeMaybeNil()
    {
        //constCompany = nil //任何情况下都不能进行 = nil操作
        unwrapCompany = nil
        wrapCompany   = nil
    }
    
    func doSomething()
    {
        constCompany.addDepartment("部门1")

        //解包方式一 安全
        wrapCompany?.addDepartment("部门2") //与下面解包等效
        //解包方式二 安全
        if let company = wrapCompany
        {
            company.addDepartment("部门3")
        }
        
        //解包方式三 不安全
        wrapCompany!.addDepartment("部门4")
        
        //不需要解包处理,但不安全
        unwrapCompany.addDepartment("部门5")
    }
    
    //非可选型
    func asParams(company : Company)
    {
        print(company)
    }
    
    func asOptionsParam(company : Company?)
    {
        //非安全解包，当调用者可正确确定参变量company在调用过程中不为nil
        company!.addDepartment("测试")
    }
    
    func asOptionsParam2(company : Company!)
    {
        company.addDepartment("行政中心")
    }
    
    func testOptions()
    {
        cp = Company(name:"anyobject")
        
        if cp is Company
        {
            //cp = nil //测试解包安全
            
            //安全解包
            (cp as? Company)?.addDepartment("测试2");
            
            //把cp 类型转换到成 Company类型后依然为封包类型,操作时进行解包，不安全
            (cp as? Company)!.addDepartment("测试2");
            
            //不安全解包
            (cp as! Company).addDepartment("测试3");
        }
    }
    
    //返回的实例不能为nil
    func returnOptions() -> Company
    {
        return Company(name: "非空实例")
    }
    
    func returnNilOption(condition:Bool) -> Company!
    {
        if condition
        {
            return Company(name:"可能为空实例")
        }
        
        return nil
    }
    
    func returnNilOption2(condition:Bool) -> Company?
    {
        if condition
        {
            return Company(name:"可能为空实例2")
        }
        
        return nil
    }
    
    deinit
    {
        //print("OptionalType free.")
    }
}