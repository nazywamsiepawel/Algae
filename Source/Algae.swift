//
//  Tensor+Operations.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 07/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

class Algae {

    class func dotvv(v1:Vector, v2:Vector) -> Double {
        // add error :v1 has to be v2 for size
        var res:Double = 0
        
        for i in 0..<v1.size {
            res += v1[i] * v2[i]
        }
        
        return res
    }

    class func mmv(v:Vector, mat:Matrix) -> Vector {
        // add error for the case when the number of columns in mat is different than number of rows in x
        let resV = Vector(size: mat.rows)
        for m in 0..<mat.rows {
            resV[m] = self.dotvv(v, v2: mat.getRow(m))
        }
        return resV
    }
    
    class func mmm(a:Matrix, b:Matrix) -> Matrix {
        let product = Matrix(rows: a.rows, cols: b.columns)
        
        for row in 0..<a.rows {
            for col in 0..<b.columns {
                let v1 = a.getRow(row)
                let v2 = b.getCol(col)
                
                product[row, col] = self.dotvv(v1, v2: v2)
            }
        }
        
        return product
    }
    
    /* element wise multiplication */
    class func mvv(v1:Vector, v2:Vector) -> Vector {
        let product = Vector(size: v1.size)
        
        for n in 0..<v1.size {
            product[n] = v1[n] * v2[n]
        }
        
        return product
    }
    
    class func diff(v1:Vector, v2:Vector) -> Vector {
        let product = Vector(size: v1.size)
        
        for n in 0..<v1.size {
            product[n] = v1[n] - v2[n]
        }
        
        return product
    }
    
    /* perform outer product */
    class func addr(v1:Vector, v2:Vector) -> Matrix {
        var product = Matrix(rows: v1.size, cols: v2.size)
        
        for i in 0..<v1.size {
            for j in 0..<v2.size {
                product[i, j] = v1[i] * v2[j]
            }
        }
        
        return product
    }
}