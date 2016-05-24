//
//  Algae+Reduce.swift
//  MLP
//
//  Created by Pawel Borkowski on 24/05/2016.
//  Copyright © 2016 Pawel Borkowski. All rights reserved.
//

import Accelerate

extension Algae {
    class func sum(v:Vector) -> Double {
        var result:Double = 0.0
        vDSP_sveD(&v.storage, 1, &result, UInt(v.size))
        return result
    }
    
//    class func sumColumns(v:Vector, _ x:Double) -> Vector {
//        var add_scalar_result = [Double](count : v.size, repeatedValue : 0.0)
//        var s = -x
//        vDSP_vsaddD(v.storage, 1, &s, &add_scalar_result, 1, vDSP_Length(v.size))
//        return Vector(data: add_scalar_result)
//        
//    }
}