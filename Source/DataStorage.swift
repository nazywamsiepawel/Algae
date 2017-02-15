//
//  DataStorage.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 07/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

open class DataStorage {
    internal var storage = [Double]()
    
    func fillRandom(_ min:Double, max:Double){
        for i in 0..<storage.count {
            storage[i] = Double.random(min: -0.5, max: 0.5)
        }
    }
    
    func fill(_ x:Double){
        for i in 0..<storage.count {
            storage[i] = x
        }
    }
    
    func zero(){
        for i in 0..<storage.count {
            storage[i] = 0.0
        }
    }
    
    func sigmoid(){
        for i in 0..<storage.count {
            storage[i] = Algae.sigmoid(storage[i])
        }
    }
    
    func sigmoidPrime(){
        for i in 0..<storage.count {
            storage[i] = Algae.sigmoidPrime(storage[i])
        }
    }

    
}
