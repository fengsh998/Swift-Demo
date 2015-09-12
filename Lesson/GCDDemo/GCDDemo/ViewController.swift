//
//  ViewController.swift
//  GCDDemo
//
//  Created by fengsh on 20/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSignalClicked(sender: AnyObject)
    {
        let rbt = Robot(name:"ios")
        rbt.running()
        rbt.accept()
    }
    
    @IBAction func onFifoClicked(sender: AnyObject)
    {
//        let rbt = Robot(name:"robot")
//        rbt.running2(true)
        
//        let test = ResCompete()
//        test.dealLock()
        
        let test = Robot2(name: "IPhone")
        //test.running()
        test.doSignalValueTest()
    }
    
    @IBAction func onConcurrentClicked(sender: AnyObject)
    {
        let rbt = Robot(name:"Rube")
        //rbt.running2(true)
        rbt.running3()
    }
}

