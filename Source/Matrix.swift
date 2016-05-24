//
//  Matrix.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 07/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

public class Matrix : DataStorage {

    var columns:Int = 0
    var rows:Int = 0
    

    public func size() -> Int {
        return storage.count
    }
    
    public func shape() -> (rows:Int, columns:Int) {
        return (rows:rows, columns:columns)
    }
    
    init(rows:Int, cols:Int){
        super.init()
        self.storage = [Double](count: rows*cols, repeatedValue: 0.0)
        self.columns = cols
        self.rows = rows
    }

    convenience init(rows:Int, cols:Int, storage:[Double]){
        self.init(rows: rows, cols:cols)
        self.storage = storage
    }

    public subscript(row: Int, col: Int) -> Double {
        get {
            let addr = row*rows + col
            return storage[addr]
        }
        set(value) {
            let addr = row*rows + col
            storage[addr] = value
        }
    }
    
    public func getRow(index:Int) -> Vector {
        let rowVector = Vector(size: self.columns)
        
        for col in 0..<self.columns {
            let addr = index*self.columns + col
            let val = self.storage[addr]
            rowVector[col] = val
        }
        return rowVector
    }
    
    public func getCol(index:Int) -> Vector {
        let colVector = Vector(size:self.rows)
        
        for row in 0..<self.rows {
            let addr = row*self.columns + index
            let val = self.storage[addr]
            colVector[row] = val
        }
        
        return colVector
    }
    
    public func setCol(index:Int, v:Vector) {
        print("\(index) > \(self.columns)")
//        assert(index > self.columns, file:"Column index out of bounds")
//        assert(v.size != self.rows, file:"Vector size is not equal to a column size")
//        
        for row in 0..<self.rows {
            let addr = row*self.columns + index
            self.storage[addr] = v[row]
        }
    }
    
    public func add(m:Matrix){
        let res = Algae.add(self, m)
        self.storage = res.storage
    }
    
    public func sub(m:Matrix) {
        let res = Algae.sub(self, m)
        self.storage = res.storage
    }
    
    public func addmm(m1:Matrix, _ m2:Matrix){
        self.add(m1*m2)
    
    }
    
    public func addr(v1:Vector, _ v2:Vector){
        self.add(Algae.ger(v1, v2))
    }
    
    public func max() -> Double {
        return Algae.max(self)
    }
    
    public func min() -> Double {
        return Algae.min(self)
    }
    
    public func t() ->  Matrix {
        return Algae.transpose(self)
    }
    
    public func log(title:String=""){
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
    
    public func copy() -> Matrix {
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