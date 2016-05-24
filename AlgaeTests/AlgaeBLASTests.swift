//
//  AlgaeBLASTests.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 16/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

import XCTest
@testable import Algae

class AlgaeBLASTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    func testADDVV(){
        
        let v1 = Vector(data: [1.0, 2.0, 3.0])
        let v2 = Vector(data: [1.0, 2.0, 3.0])
        
        let m1 = Matrix(rows: 3, cols: 4)
        m1.fill(2.0)
        
        let m2 = Matrix(rows: 3, cols: 4)
        m2.fill(2.0)
        
        let scalar : Double = 1.0
        
        /* Test adding scalar to vector */
        let expected_vs = Vector(data: [2.0, 3.0, 4.0])
        let result_vs = Algae.add(v1, scalar)
        XCTAssert(result_vs.storage == expected_vs.storage, "ADD VS Corect")
        
        
        /* Test adding two vectors */
        let expected_vv = Vector(data: [2.0, 4.0, 6.0])
        let result_vv = Algae.add(v1, v2)
        XCTAssert(result_vv.storage == expected_vv.storage, "ADD VV Corect")
        
        /* Test adding two Matrixes */
        let expected_mm = Matrix(rows: 3, cols: 4)
        expected_mm.fill(4.0)
        
        let result_mm = Algae.add(m1, m2)
        
        XCTAssert(expected_mm.storage == result_mm.storage, "ADD MM Corect")
        XCTAssert(expected_mm.columns == result_mm.columns, "ADD MM Corect")
        XCTAssert(expected_mm.rows == result_mm.rows, "ADD VV Corect")
        
        /* Test adding scalar to Matrix */
        let expected_ms = Matrix(rows: 3, cols: 4)
        expected_ms.fill(3.0)
        let result_ms = Algae.add(m1, scalar)
        XCTAssert(expected_ms.storage == result_ms.storage, "ADD MM Corect")
        XCTAssert(expected_ms.columns == result_ms.columns, "ADD MM Corect")
        XCTAssert(expected_ms.rows == result_ms.rows, "ADD VV Corect")
    }
    
    func testMUL(){
        
        let v1 = Vector(data: [1.0, 2.0, 3.0])
        let v2 = Vector(data: [1.0, 2.0, 3.0])
        
        let m1 = Matrix(rows: 3, cols: 4)
        m1.fill(2.0)
        
        let m2 = Matrix(rows: 3, cols: 4)
        m2.fill(2.0)
        let scalar : Double = 2.0
        
        
        /* Test vector - vector multiplication */
        let expected_vv = Vector(data: [1.0, 4.0, 9.0])
        let result_vv = Algae.mul(v1, v2)
        XCTAssert(result_vv.storage == expected_vv.storage, "MUL VV Corect")
        
        /* Test vector - scalar multiplication */
        let expected_vs = Vector(data: [2.0, 4.0, 6.0])
        let result_vs = Algae.mul(v1, scalar)
        XCTAssert(expected_vs.storage == result_vs.storage, "MUL VS Corect")
        
        /* Test matrix - scalar multiplication */
        let expected_ms = Matrix(rows: 3, cols: 4)
        expected_ms.fill(4.0)
        let result_ms = Algae.mul(m1, scalar)
        XCTAssert(expected_ms.storage == result_ms.storage, "MUL MS Corect")
    }
    
    func testSUB(){
        let v1 = Vector(data: [0.75, 2.0, 3.0])
        let v2 = Vector(data: [0.9, 2.0, 3.0])
        
        let m1 = Matrix(rows: 3, cols: 4)
        m1.fill(0.75)
        
        let m2 = Matrix(rows: 3, cols: 4)
        m2.fill(0.9)
        let scalar : Double = 2.0
        
        /* Test subtracting two vectors */
        let expected_vv = Vector(data: [-0.15, 0.0, 0.0])
        let result_vv = Algae.sub(v1, v2)
       // XCTAssert(result_vv.storage == expected_vv.storage, "SUB VV Corect")
        
        /* Test subtracting scalar from vector */
        let expected_vs = Vector(data: [-1.25, 0.0, 1.0])
        let result_vs = Algae.sub(v1, scalar)
       XCTAssert(result_vs.storage == expected_vs.storage, "SUB VS Corect")
        
        /* Test subtracting scalar from Matrix */
        let expected_ms = Matrix(rows: 3, cols: 4)
        expected_ms.fill(-1.25)
        let result_ms = Algae.sub(m1, scalar)
//        XCTAssert(expected_ms.storage == result_ms.storage, "SUB MS Corect") -- FIX FLOATING POINTS
        XCTAssert(expected_ms.columns == result_ms.columns, "Columns Corect")
        XCTAssert(expected_ms.rows == result_ms.rows, "Rows Corect")

        /* Test substracting matrix for matrix */
        
        let expected_mm = Matrix(rows: 3, cols: 4)
        expected_mm.fill(-0.15)
        
        let result_mm = Algae.sub(m1, m2)
        
//        XCTAssert(expected_mm.storage == result_mm.storage, "SUB MM Corect") -- FIX FLOATING POINTS
        XCTAssert(expected_mm.columns == result_mm.columns, "Columns Correct")
        XCTAssert(expected_mm.rows == result_mm.rows, "Rows Correct")
    }
    
    func testDIV(){
        let v1 = Vector(data: [1.0, 2.0, 3.0])
        let v2 = Vector(data: [1.0, 2.0, 3.0])
        
        let m1 = Matrix(rows: 3, cols: 4)
        m1.fill(2.0)

        let scalar : Double = 2.0
        
        /* Test vector - scalar division */
        let expected_vs = Vector(data: [0.5, 1.0, 1.5])
        let result_vs = Algae.div(v1, scalar)
        XCTAssert(expected_vs.storage == result_vs.storage, "MUL VS Corect")
        
        /* Test matrix - scalar division */
        let expected_ms = Matrix(rows: 3, cols: 4)
        expected_ms.fill(1.0)
        let result_ms = Algae.div(m1, scalar)
        XCTAssert(expected_ms.storage == result_ms.storage, "MUL MS Corect")
        
    }
    
    func testDOT(){
        let v1 = Vector(data: [4.0, -1.0, 2.0])
        let v2 = Vector(data: [2.0, -2.0, -1.0])
        let dot = Algae.dot(v1, v2)
        XCTAssert(dot == 8, "Vector dot product correct")
    }
    
    func testMV(){
        let v = Vector(data: [2.0, 1.0, 0.0])
        let m = Matrix(rows: 2, cols: 3, storage: [1.0, -1.0, 2.0, 0.0, -3.0, 1.0])
        let resV = Algae.mv(m, v)
        XCTAssert(resV.storage == [1.0, -3.0], "Vector matrix multiplication result correct")
    }
    
    func testMM(){
        let a =  Matrix(rows: 2, cols: 3, storage: [0.0, 4.0, -2.0, -4.0, -3.0, 0.0])
        let b = Matrix(rows: 3, cols: 2, storage: [0.0, 1.0, 1.0, -1.0, 2.0, 3.0])
        var expected_mm = Algae.mm(a, b)
        XCTAssert(expected_mm.storage == [0.0, -10.0, -3.0, -1.0], "matrix matrix multiplication result correct")
        XCTAssert(expected_mm.columns == b.columns, "Columns Correct")
        XCTAssert(expected_mm.rows == a.rows, "Rows Correct")
    }
    
    func testTRANSPOSE(){
        let a = Matrix(rows:3, cols:2, storage:[1, 2, 3, 4, 5, 6])
        let expected_m = Matrix(rows: 2, cols: 3, storage: [1, 4, 2, 5, 3, 6])
        let b = Algae.transpose(a)
       
        XCTAssert(expected_m.columns == b.columns, "Columns Correct")
        XCTAssert(expected_m.rows == b.rows, "Rows Correct")
        XCTAssert(expected_m.storage == b.storage, "matrix tranpose data correct")
    }
    
    func testGER(){
        let v1 = Vector(data: [2.0, 2.0, 2.0])
        let v2 = Vector(data: [2.0, 2.0, 2.0])
        let product = Matrix(rows: 3, cols: 3)
        product.fill(4.0)
        
        let product2 = Algae.ger(v1, v2)
        
        XCTAssert(product.storage == product2.storage, "vv outer product correct")
    }
    
    func testMINMAX(){
        let v = Vector(data: [4.0, -1.0, 2.0, 100.0])
        let max = Algae.max(v)
        let min = Algae.min(v)
        XCTAssert(max == 100.0, "Max Correct")
        XCTAssert(min == -1.0, "Min Correct")
        let m =  Matrix(rows: 2, cols: 3, storage: [0.0, 4.0, -2.0, -4.0, -3.0, 0.0, 100.0])
        let max2 = Algae.max(m)
        let min2 = Algae.min(m)
        XCTAssert(max2 == 100.0, "Max Correct")
        XCTAssert(min2 == -4.0, "Min Correct")
    }
    
    func testNEG(){
        let v = Vector(data: [1, 1, 1])
        let predicted_v = Vector(data: [-1, -1, -1])
        let result_v = Algae.neg(v)
        XCTAssert(predicted_v.storage == result_v.storage, "Neg vector correct")
        
        let m = Matrix(rows: 2, cols: 2)
        m.fill(1.0)
        
        let predicted_m = Matrix(rows: 2, cols: 2)
        predicted_m.fill(-1.0)
        
        let result_m = Algae.neg(m)
        
         XCTAssert(predicted_m.storage == result_m.storage, "Neg matrix correct")
        
    }
}

