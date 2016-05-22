//
//  Misc.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 06/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

public func meanSquaredError(errors:[Double]) -> Double {
    var sum:Double = 0.0
    
    for iError in 0..<errors.count {
        let squared = errors[iError]^^2
        sum += squared
    }
    
    return Double(sum) / Double(errors.count)
}

public func tanh(x:Double) -> Double {
    return tanh(x)
}

public func tanhPrime(x:Double) -> Double {
    return 1 - (x*x)
}

public extension Double {
    public static func random() -> Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }

    public static func random(min min: Double, max: Double) -> Double {
        return Double.random() * (max - min) + min
    }

}

//
//
//func exp(x:Double) -> Double {
//    return pow(2.71828, x)
//}


infix operator ^^ { }
func ^^ (radix: Double, power: Int) -> Double {
    return Double(pow(Double(radix), Double(power)))
}
