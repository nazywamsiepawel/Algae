//
//  Matrix.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 07/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

open class Matrix : DataStorage {

    var columns:Int = 0
    var rows:Int = 0
    

    open func size() -> Int {
        return storage.count
    }
    
    open func shape() -> (rows:Int, columns:Int) {
        return (rows:rows, columns:columns)
    }
    
    init(rows:Int, cols:Int){
        super.init()
        self.storage = [Double](repeating: 0.0, count: rows*cols)
        self.columns = cols
        self.rows = rows
    }

    convenience init(rows:Int, cols:Int, storage:[Double]){
        self.init(rows: rows, cols:cols)
        self.storage = storage
    }

    open subscript(row: Int, col: Int) -> Double {
        get {
            let addr = row*rows + col
            return storage[addr]
        }
        set(value) {
            let addr = row*rows + col
            storage[addr] = value
        }
    }
    
    open func getRow(_ index:Int) -> Vector {
        let rowVector = Vector(size: self.columns)
        
        for col in 0..<self.columns {
            let addr = index*self.columns + col
            let val = self.storage[addr]
            rowVector[col] = val
        }
        return rowVector
    }
    
    open func getCol(_ index:Int) -> Vector {
        let colVector = Vector(size:self.rows)
        
        for row in 0..<self.rows {
            let addr = row*self.columns + index
            let val = self.storage[addr]
            colVector[row] = val
        }
        
        return colVector
    }
    
    open func setCol(_ index:Int, v:Vector) {
        print("\(index) > \(self.columns)")
//        assert(index > self.columns, file:"Column index out of bounds")
//        assert(v.size != self.rows, file:"Vector size is not equal to a column size")
//        
        for row in 0..<self.rows {
            let addr = row*self.columns + index
            self.storage[addr] = v[row]
        }
    }
    
    open func add(_ m:Matrix){
        let res = Algae.add(self, m)
        self.storage = res.storage
    }
    
    open func sub(_ m:Matrix) {
        let res = Algae.sub(self, m)
        self.storage = res.storage
    }
    
    open func addmm(_ m1:Matrix, _ m2:Matrix){
        self.add(m1*m2)
    
    }
    
    open func addr(_ v1:Vector, _ v2:Vector){
        self.add(Algae.ger(v1, v2))
    }
    
    open func max() -> Double {
        return Algae.max(self)
    }
    
    open func min() -> Double {
        return Algae.min(self)
    }
    
    open func t() ->  Matrix {
        return Algae.transpose(self)
    }
    
    open func log(_ title:String=""){
        print("")
        for iRow in 0..<self.rows {
            let row = self.getRow(iRow)
            print("|", terminator:"")
            for elem in 0..<row.size {
                print("\(row[elem]) ", terminator:"")
            }
            print("|")
        }
        print("\(title) : Matrix of size [\(self.rows) x \(self.columns)]")
    }
    
    open func copy() -> Matrix {
        return Matrix(rows: self.rows, cols: self.columns, storage: self.storage)
    }
    
    func normalizeColumns(){
        for i in 0..<self.columns {
            var col = self.getCol(i)
            col = col / col.max()
            self.setCol(i, v: col)
        }
    }
    
    func normalize(toValue val:Double){
        for i in 0..<self.storage.count {
            self.storage[i] = self.storage[i]/val
        }
    }
        
}
