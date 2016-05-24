
//
//  Algae+BLAS.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 16/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation
import Accelerate

extension Algae {
    class func add(v1:Vector, _ v2:Vector) -> Vector {
        assert(v1.size == v2.size, "Vectors must be the same size.")
        /* Both have to have the same size */
        var add_result = [Double](count : v1.size, repeatedValue : 0.0)
        vDSP_vaddD(v1.storage, 1, v2.storage, 1, &add_result, 1, vDSP_Length(v1.size))
        return Vector(data: add_result)
    }
    
    class func add(m1:Matrix, _ m2:Matrix) -> Matrix {
        assert(m1.columns == m2.columns, "Matrices must be the same shape.")
        assert(m1.rows == m2.rows, "Matrices must be the same shape.")
        
        /* Both have to be the same shape */
        var add_result = [Double](count : m1.size(), repeatedValue : 0.0)
        vDSP_vaddD(m1.storage, 1, m2.storage, 1, &add_result, 1, vDSP_Length(m1.size()))
        return Matrix(rows: m1.rows, cols: m1.columns, storage: add_result)
    }
    
    class func add(v:Vector, _ x:Double) -> Vector {
        var add_scalar_result = [Double](count : v.size, repeatedValue : 0.0)
        var s = x
        vDSP_vsaddD(v.storage, 1, &s, &add_scalar_result, 1, vDSP_Length(v.size))
        return Vector(data: add_scalar_result)
    }
    
    class func add(m:Matrix, _ x:Double) -> Matrix{
        var add_scalar_result = [Double](count : m.size(), repeatedValue : 0.0)
        var s = x
        vDSP_vsaddD(m.storage, 1, &s, &add_scalar_result, 1, vDSP_Length(m.size()))
        return Matrix(rows: m.rows, cols: m.columns, storage: add_scalar_result)
    }
    
    
    class func mul(v1:Vector, _ v2:Vector) -> Vector {
        //assert(v1.size == v2.size, "Vectors must be the same size.")
        /* vector - vector multiplication */
        var mul_result = [Double](count : v1.size, repeatedValue : 0.0)
        vDSP_vmulD(v1.storage, 1, v2.storage, 1, &mul_result, 1, vDSP_Length(v1.size))
        return Vector(data: mul_result)
    }
    
    class func mul(v:Vector, _ x:Double) -> Vector {
        var mul_scalar_result = [Double](count : v.size, repeatedValue : 0.0)
        var s = x
        vDSP_vsmulD(v.storage, 1, &s, &mul_scalar_result, 1, vDSP_Length(v.size))
        return Vector(data: mul_scalar_result)
    }
    
    class func mul(m:Matrix, _ x:Double) -> Matrix {
        var mul_scalar_result = [Double](count : m.size(), repeatedValue : 0.0)
        var s = x
         vDSP_vsmulD(m.storage, 1, &s, &mul_scalar_result, 1, vDSP_Length(m.size()))
        return Matrix(rows: m.rows, cols: m.columns, storage: mul_scalar_result)
    }
    
    class func sub(v1:Vector, _ v2:Vector) -> Vector {
        assert(v1.size == v2.size, "Vectors must be the same size.")
        /* Both have to have the same size */
        var sub_result = [Double](count : v1.size, repeatedValue : 0.0)
        vDSP_vsubD(v2.storage, 1, v1.storage, 1, &sub_result, 1, vDSP_Length(v1.size))
        return Vector(data: sub_result)
    }
    
    class func sub(v:Vector, _ x:Double) -> Vector {
        var add_scalar_result = [Double](count : v.size, repeatedValue : 0.0)
        var s = -x
        vDSP_vsaddD(v.storage, 1, &s, &add_scalar_result, 1, vDSP_Length(v.size))
        return Vector(data: add_scalar_result)

    }
    
    class func sub(m:Matrix, _ x:Double) -> Matrix{
        var add_scalar_result = [Double](count : m.size(), repeatedValue : 0.0)
        var s = -x
        vDSP_vsaddD(m.storage, 1, &s, &add_scalar_result, 1, vDSP_Length(m.size()))
        return Matrix(rows: m.rows, cols: m.columns, storage: add_scalar_result)
    }
    
    class func sub(m1:Matrix, _ m2:Matrix) -> Matrix {
        assert(m1.columns == m2.columns, "Matrices must be the same shape.")
        assert(m1.rows == m2.rows, "Matrices must be the same shape.")
        /* Both have to be the same shape */
        var add_result = [Double](count : m1.size(), repeatedValue : 0.0)
        vDSP_vsubD(m2.storage, 1, m1.storage, 1, &add_result, 1, vDSP_Length(m1.size()))
        return Matrix(rows: m1.rows, cols: m1.columns, storage: add_result)
    }
    
    class func div(v:Vector, _ x:Double) -> Vector {
        var div_scalar_result = [Double](count : v.size, repeatedValue : 0.0)
        var s = x
        vDSP_vsdivD(v.storage, 1, &s, &div_scalar_result, 1, vDSP_Length(v.size))
        return Vector(data: div_scalar_result)
    }
    
    class func div(m:Matrix, _ x:Double) -> Matrix {
        var div_scalar_result = [Double](count : m.size(), repeatedValue : 0.0)
        var s = x
        vDSP_vsdivD(m.storage, 1, &s, &div_scalar_result, 1, vDSP_Length(m.size()))
        return Matrix(rows: m.rows, cols: m.columns, storage: div_scalar_result)
    }
    
    class func dot(v1:Vector, _ v2:Vector) -> Double {
        var dot_product_result = 0.0
        vDSP_dotprD(v1.storage, 1, v2.storage, 1, &dot_product_result, vDSP_Length(v2.size))
        return dot_product_result
    }
    
    class func mv(m:Matrix, _ v:Vector) -> Vector {
        let product = Vector(size: m.rows)
        var mresult = [Double](count : product.size, repeatedValue : 0.0)
        vDSP_mmulD(m.storage, 1, v.storage, 1, &mresult, 1, UInt(m.rows), 1, UInt(v.size))
        return Vector(data: mresult)
    }
    
    class func mm(m1:Matrix, _ m2:Matrix) -> Matrix {
       // assert(m1.rows == m2.columns, "Matrices must have correct shape.")
        var matrix_multiplication_res = Matrix(rows: m1.rows, cols: m2.columns)
        var mresult = [Double](count : matrix_multiplication_res.size(), repeatedValue : 0.0)
        vDSP_mmulD(m1.storage, 1, m2.storage, 1, &mresult, 1, UInt(m1.rows), UInt(m2.columns), UInt(m2.rows))
        matrix_multiplication_res.storage = mresult
        return matrix_multiplication_res
    }
    
    class func transpose(m:Matrix) -> Matrix {
        var transpose_result = [Double](count : m.size(), repeatedValue : 0.0)
        vDSP_mtransD(m.storage, 1, &transpose_result, 1, UInt(m.rows), UInt(m.columns))
        return Matrix(rows: m.columns, cols: m.rows, storage:transpose_result)
    }
    
    class func max(v:Vector) -> Double {
        var result:Double = 0.0
        vDSP_maxvD(v.storage, 1, &result, UInt(v.size))
        return result
    }
    
    class func max(m:Matrix) -> Double {
        var result:Double = 0.0
        vDSP_maxvD(m.storage, 1, &result, UInt(m.size()))
        return result
    }
    
    class func min(v:Vector) -> Double {
        var result:Double = 0.0
        vDSP_minvD(v.storage, 1, &result, UInt(v.size))
        return result
    }
    
    class func min(m:Matrix) -> Double {
        var result:Double = 0.0
        vDSP_minvD(m.storage, 1, &result, UInt(m.size()))
        return result
    }
    
    /* Vector vector outer product */
    class func ger(v1:Vector, _ v2:Vector) -> Matrix {
        let m1 = Matrix(rows: v1.size, cols: 1, storage: v1.storage)
        let m2 = Matrix(rows: 1, cols: v2.size, storage: v2.storage)
        let product = self.mm(m1, m2)
        return product
    }
    
    class func neg(v:Vector) -> Vector {
        var neg_result = [Double](count: v.size, repeatedValue: 0.0)
        vDSP_vnegD(v.storage, 1, &neg_result, 1, UInt(v.size))
        return Vector(data: neg_result)
    }
    
    class func neg(m:Matrix) -> Matrix {
        var neg_result = [Double](count: m.size(), repeatedValue: 0.0)
        vDSP_vnegD(m.storage, 1, &neg_result, 1, UInt(m.size()))
        return Matrix(rows: m.rows, cols: m.columns, storage: neg_result)
    }
}

