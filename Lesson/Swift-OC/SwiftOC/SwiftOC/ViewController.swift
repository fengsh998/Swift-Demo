//
//  ViewController.swift
//  SwiftOC
//
//  Created by fengsh on 18/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import UIKit

import swiftlib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onsameclick(sender: AnyObject)
    {
        let oc = OCSource()
        oc.toCallSwiftAPIInSameProject()
    }
    
    @IBAction func oncalllib(sender: AnyObject)
    {
        //调用oc 的lib接口
        let oclib = OCDatatypeTest()
        
        let e :OCEnum = oclib.getCurrentEnum();
        
        if (e.rawValue == OCEnum.ocState.rawValue)
        {
            print("枚举判断正确");
        }
        
        oclib.setDatatype(20, withString: "可以为空哦", withBool: true, withEnum: OCEnum.ocOK, withCGFloat: 30.3, withCGPoint: CGPoint(x: 15, y: 60), withCGSize: CGSize(width: 300, height: 200), withID: nil, withNSNumber: NSNumber(double: 6.0), withNSArray: [3,5,6,8], withBlock: { (a, b) -> Int in
            return a+b
            }, withNSDictionary: ["key":"value"])
    }

    @IBAction func onframework(sender: AnyObject)
    {
        let swift = NonOcCall()
        
        swift .swiftType("swift call swift ", i: 20, f: 30.5, d: 60.66, flag: false, arr: [54,23,11], dic: ["key":"v"], closure: { (a, b) -> Int in
            return a+b
            }, e: SwiftEnum.state, tuples: (100,"OK"))        
    }

    //OC调用OC的静态库.a文件中的api
    @IBAction func onTest(sender: AnyObject) {
        let oc = OCSource()
        oc.toCallLibOCApi()
    }
    
    //OC调用swift的动态库中使用oc写的api
    @IBAction func onTest1(sender: AnyObject) {
        let oc = OCSource()
        oc.toCallSwiftFrameworkOCApi()
    }
    
    //OC调用swift的动态库中使用swift写的api
    @IBAction func onTest2(sender: AnyObject) {
        let oc = OCSource()
        oc.toCallSwiftFrameworkSwiftApi()
    }
}

