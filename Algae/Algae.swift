//
//  Algae.swift
//  Algae
//
//  Created by Pawel Borkowski on 20/03/2016.
//  Copyright © 2016 Pawel Borkowski. All rights reserved.
//

import Foundation

public class Algae {
    init(){
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let path = bundle.pathForResource("FOCUS", ofType: "png")!
//        let xmlData = NSData(contentsOfFile: path)
//        print(xmlData)
//        print("")
//        let path = bundle.pathForResource("Shaders", ofType: "metal")
//        do {
//            
//            let input = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
//        } catch let e {
//            Swift.print("\(e)")
//        }
        
        let device = MetalDevice()
        let z = device.sigmoid([1.0, 1.0, 1.0])
        print(z);
    }
    
   }