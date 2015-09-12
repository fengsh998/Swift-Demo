//
//  referenceSwift.swift
//  closure
//
//  Created by fengsh on 6/9/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import Foundation


// weak是针对可选类型变量进行弱引用。
// unowned 是针对非可选类型变量进行弱引用，一般用于闭包实体中解除引用自身所导致的循环引用。

class Aclass
{
    var objb : Bclass!
    
    //unowned var unownedobjb : Bclass = Bclass() //这样使用很危险 即刻就会free掉因为不会设置为nil.这时形成野指针。
    
    init()
    {
        print("A init.")
    }
    
    //weak var weakobjb:Bclass!
    
    
    deinit
    {
        print("A free.")
    }
}

class Bclass
{
    init()
    {
        print("B init.")
    }
    
    var obja:Aclass! = nil
    
    deinit
    {
        print("B free.")
    }
}
