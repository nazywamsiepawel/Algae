//
//  MatrixTests.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 07/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import XCTest

@testable import Algae

class MatrixTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testAddressing(){
       var storage = [Double]()

        for i in 0..<16 {
            storage.append(Double(i))
        }

        let mat = Matrix(rows: 4, cols: 4, storage: storage)
        
        XCTAssert(mat[3, 3] == 15.0, "Correct 2D addressing")
        XCTAssert(mat[2, 3] == 11.0, "Correct 2D addressing")
        XCTAssert(mat[0, 2] == 2.0, "Correct 2D addressing")
    }
    
    func testGettingRow(){
        var storage = [Double]()
        for i in 0..<16 {
            storage.append(Double(i))
        }
        let mat = Matrix(rows: 4, cols: 4, storage: storage)
        let row = mat.getRow(1)
        XCTAssert(row.storage == [4.0, 5.0, 6.0, 7.0])
        
        let v = Vector(data: [2.0, 1.0, 0.0])
        let m = Matrix(rows: 2, cols: 3, storage: [1.0, -1.0, 2.0, 0.0, -3.0, 1.0])
        var row2 = m.getRow(1)
        XCTAssert(row2.storage == [0.0, -3.0, 1.0])

    }
    
    func testGettingColumn(){
        var storage = [Double]()
        
        for i in 0..<16 {
            storage.append(Double(i))
        }
        
        let mat = Matrix(rows: 4, cols: 4, storage: storage)
        
        let column = mat.getCol(1)
        
        XCTAssert(column.storage == [1.0, 5.0, 9.0, 13.0])
    }
}

