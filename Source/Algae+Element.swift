//
//  Algae+Element.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 14/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

/* Element wise operations */

extension Algae {
    
    class func sigmoid(_ x:Double) -> Double {
        return  Double(1) / (Double(1) + exp(-x))
    }
    
    class func sigmoidPrime(_ x:Double) -> Double {
        return exp(-x)/pow((1+exp(-x)), 2)
       // return x*(1-x)
    }
    
    class func sigmoid(_ m:Matrix) -> Matrix {
        let res = m.copy()
        
        for i in 0..<res.storage.count {
            res.storage[i] = Algae.sigmoid(res.storage[i])
        }
        return res
    }
    
    class func sigmoidPrime(_ m:Matrix) -> Matrix {
        let res = m.copy()
        
        for i in 0..<res.storage.count {
            res.storage[i] = Algae.sigmoidPrime(res.storage[i])
        }
        return res
    }

}
