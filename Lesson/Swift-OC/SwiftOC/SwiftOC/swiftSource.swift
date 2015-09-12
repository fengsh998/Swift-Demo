//
//  swiftSource.swift
//  SwiftOC
//
//  Created by fengsh on 19/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import UIKit

import swiftlib

class swiftMix : NSObject
{
    override init()
    {
        print("swiftMix init.")
    }
    
    //在同一项目中使用OC的方法
    func toUseOcAPIInSameProject()
    {
        //OCSource.share() 静态类方法
        let oc = OCSource()
        oc.callCategoryFunction()
        let result = oc.multi(20, with: 20)
        print(result)
    }
    
    deinit
    {
        print("swiftMix free.")
    }
}