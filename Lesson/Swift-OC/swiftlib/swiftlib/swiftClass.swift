//
//  swiftClass.swift
//  swiftlib
//
//  Created by fengsh on 18/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//
/*
    String
    Int
    Float
    Double
    Bool
    Array
    Dictionary
    元组tuples
    泛型
    枚举
*/

import Foundation

/*
    public : 对于framework中,只有使用该关键词外部才能看到。
*/

//普通swift的枚举类型
public enum SwiftEnum
{
    case none
    case state
    case ok
}

public enum SwiftNonOC
{
    case ST(Int,Int)
    case VT(String)
}

public var globlevar = "globle variable"

//不支持OC调用
public class NonOcCall
{
    public init()
    {
        print("School init.")
        
    }
    
    //泛型
    public func swapTwoValues<T>(inout a: T, inout b: T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //swift的枚举类型
    public func setEnumType(senum:SwiftNonOC)
    {
        switch senum
        {
        case .ST(let a,let b):
            print("a :\(a) b :\(b)")
        case .VT(let str):
            print("str " + str)
        }
    }
    
    public func swiftType(s:String,i:Int,f:Float,d:Double,flag:Bool,arr:Array<Int>,dic:Dictionary<String,String>,
        closure:((Int,Int)->Int)?,e:SwiftEnum,tuples:(Int,String))
    {
        if let block = closure
        {
            let sum = block(30,48)
            print("30 + 48 = \(sum)")
        }
        
        print("s : " + s + ",i : \(i)" + ",f : \(f)" + ",d : \(d)" + ",flag : \(flag)")
        print("\narr : \(arr)")
        print("dic : \(dic)" + "e : \(e)" + "tuples : \(tuples)")
    }
    
    deinit
    {
        print("School free.")
    }
}

@objc (ObjectCCallSwift)

public class ObjectCCallSwift
{
     public init()
    {
        print("swiftCallOc init.")
    }
    
    public let name : String! = "swiftCallOc"
    
    //只需要在前面加个@objc如果报错就说明方法中函有oc不能识别的所以不能转为OC调用
    public func testEnum(senum:SwiftNonOC)
    {
        print("\(senum)")
    }
    
    public func testNormalEnum(normal:SwiftEnum)
    {
        print("normal enum : \(normal)")
    }
    
    //泛型
    public func swapTwoValues<T>(inout a: T, inout b: T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    @objc public func display()
    {
        print("ocCanCallSwift display is call.")
    }
    
    //因为该class不是继承自NSObject如果在oc中使用是没有alloc方法的，所在要提供一个构造方法
    public class func construct() -> ObjectCCallSwift
    {
        let obj = ObjectCCallSwift()
        return obj;
    }
    
    deinit
    {
        print("swiftCallOc free.")
    }
}

//直接继承自NSObject
public class SwiftObj : NSObject
{
    public override init() {
        
    }
    
    public func testEnum(senum:SwiftNonOC)
    {
        print("\(senum)")
    }
    
    public func display()
    {
        // TODO : Call OC Source file by bridge header files
        print("SwiftObj is call.")
    }
    
    deinit
    {
        
    }
}

extension SwiftObj
{
    //计算属性(提供getter/setter)
    var exname : String {
        get{
        return "扩展的"
        }
        set{
            self.exname = newValue
        }
    }
    
    func setExName(name:String)
    {
        exname = name
    }
}