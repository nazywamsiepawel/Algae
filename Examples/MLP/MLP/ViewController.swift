//
//  ViewController.swift
//  MLP
//
//  Created by Pawel Borkowski on 22/05/2016.
//  Copyright © 2016 Pawel Borkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        
        let m = MLP()
        m.cost()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

