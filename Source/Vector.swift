//
//  Vector.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 07/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

open class Vector : DataStorage {
    
    init(size : Int) {
        super.init()
        self.storage = [Double](repeating: 0.0, count: size)
    }
    
    convenience init(data:[Double]){
        self.init(size: data.count)
        self.storage = data
    }
    
    open var size: Int {
        return self.storage.count
    }
    
    open subscript(index: Int) -> Double {
        get {
            return self.storage[index]
        }
        set(value){
            self.storage[index] = value
        }
    }
    
    open func copy() -> Vector {
        return Vector(data: self.storage)
    }
    
    open func add(_ v:Vector) {
        let res = Algae.add(self, v)
        self.storage = res.storage
    }
    
    open func sub(_ v:Vector) {
        let res = Algae.sub(self, v)
        self.storage = res.storage
    }
    
    open func addmv(_ m:Matrix, _ v:Vector){
        self.add(m*v)
    }
    
    open func max() -> Double {
        return Algae.max(self)
    }
    
    open func min() -> Double {
        return Algae.min(self)
    }
    
   
    open func row() -> Matrix {
        return Matrix(rows: 1, cols: self.size, storage:self.storage)
    }
    
    
    open func col() -> Matrix {
        return Matrix(rows: self.size, cols: 1, storage:self.storage)
    }
    open func log(_ title:String=""){
        print("")
        
        for elem in self.storage {
            print("| \(elem) |")
        }
        
        print("\(title) : Vector of size [\(self.size)]")
    }
    
}
