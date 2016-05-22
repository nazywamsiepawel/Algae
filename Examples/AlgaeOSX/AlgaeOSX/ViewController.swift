//
//  ViewController.swift
//  AlgaeOSX
//
//  Created by Pawel Borkowski on 20/03/2016.
//  Copyright © 2016 Pawel Borkowski. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var button: NSButton!
    @IBOutlet weak var label1: NSTextField!
    @IBOutlet weak var label2: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func buttonTapped(button: NSButton)
    {
     runNegTest(1000 * 1000 * 10)
    }
    
    
    func runNegTest(size:Int) {
        let m = MetalDevice()
        print("RUNNING TEST NEG, size : \(size)")
        print("> Initializing random vectors")
        let v1 = Vector(size: size)
        v1.fill(2.0)
        
        print("> NEG, simd ")
        var start = NSDate()
        Algae.neg(v1)
        label1.stringValue = "SIMD : \(NSDate().timeIntervalSinceDate(start))"
        
        print("> NEG, gpu ")
        start = NSDate()
        
        m.neg(v1)
        label2.stringValue = "Metal : \(NSDate().timeIntervalSinceDate(start))"
        print("*finished*\n\n")
    }



}

