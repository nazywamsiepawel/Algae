//
//  Vector.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 07/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

public class Vector : DataStorage {
    
    init(size : Int) {
        super.init()
        self.storage = [Double](count: size, repeatedValue: 0.0)
    }
    
    convenience init(data:[Double]){
        self.init(size: data.count)
        self.storage = data
    }
    
    public var size: Int {
        return self.storage.count
    }
    
    public subscript(index: Int) -> Double {
        get {
            return self.storage[index]
        }
        set(value){
            self.storage[index] = value
        }
    }
    
    public func copy() -> Vector {
        return Vector(data: self.storage)
    }
    
    public func add(v:Vector) {
        let res = Algae.add(self, v)
        self.storage = res.storage
    }
    
    public func sub(v:Vector) {
        let res = Algae.sub(self, v)
        self.storage = res.storage
    }
    
    public func addmv(m:Matrix, _ v:Vector){
        self.add(m*v)
    }
    
    public func max() -> Double {
        return Algae.max(self)
    }
    
    public func min() -> Double {
        return Algae.min(self)
    }
    
   
    public func row() -> Matrix {
        return Matrix(rows: 1, cols: self.size, storage:self.storage)
    }
    
    
    public func col() -> Matrix {
        return Matrix(rows: self.size, cols: 1, storage:self.storage)
    }
    public func log(title:String=""){
        print("")
        
        for elem in self.storage {
            print("| \(elem) |")
        }
        
        print("\(title) : Vector of size [\(self.size)]")
    }
    
}