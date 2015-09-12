//
//  ViewController.swift
//  SwiftC
//
//  Created by fengsh on 17/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // call c code
        let unsafePointerOfN = ("abcdef" as NSString).UTF8String
        let w: UnsafeMutablePointer<Int8> = UnsafeMutablePointer(unsafePointerOfN)
        
        let unsafek = ("213" as NSString).UTF8String
        let k: UnsafeMutablePointer<Int8> = UnsafeMutablePointer(unsafek)

        let s: UnsafeMutablePointer<Int8> = UnsafeMutablePointer(unsafek)

        
        Encrypt(w, k,s)
        
        let ret = String.fromCString(s)
        
        print(ret)
        
        
        // call c++
        let boc : BridgeOC = BridgeOC()
        boc.callCppDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

