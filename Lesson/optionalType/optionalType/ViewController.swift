//
//  ViewController.swift
//  optionalType
//
//  Created by fengsh on 23/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let option = OptionalType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setnil(sender: AnyObject)
    {
        option.sometimeMaybeNil()
    }

    @IBAction func call(sender: AnyObject)
    {
        option.doSomething()
    }
    
    @IBAction func testoptions(sender: AnyObject)
    {
        option.testOptions()
    }
    
    @IBAction func testReturn(sender: AnyObject)
    {
        let instance = option.returnNilOption(false)
        
        if instance == nil
        {
            print("实例为:\(instance)")
            //instance.addDepartment("不安全")
        }
        
        let instance2 = option.returnNilOption2(false)
        instance2?.addDepartment("安全")
    }
}

