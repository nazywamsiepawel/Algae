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

class AlgaeReduceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testSUM(){
        let v1 = Vector(data: [1.0, 2.0, 3.0])
        XCTAssert(Algae.sum(v1) == 6.0, "SUM V Corect")
        
        let v2 = Vector(data: [1.0, -200.0, 3.0])
        XCTAssert(Algae.sum(v2) == -196.0, "SUM V Corect")
        
    }
}

