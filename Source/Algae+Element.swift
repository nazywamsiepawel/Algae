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
    
    class func sigmoid(x:Double) -> Double {
        return  Double(1) / (Double(1) + exp(-x))
    }
    
    class func sigmoidPrime(x:Double) -> Double {
        return exp(-x)/pow((1+exp(-x)), 2)
       // return x*(1-x)
    }

}