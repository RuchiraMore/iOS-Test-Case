//
//  BasicFlow.swift
//  UnitTestingTests
//
//  Created by webwerks on 28/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import XCTest
//import your project here
@testable import UnitTesting

class BasicFlow: XCTestCase {

    func testSquareInt() {
        let value:Int = 2
        
        let squareVal = MainViewController().square(value: value)
        XCTAssertEqual(squareVal, 4)
    }
    
    func testHelloWorld() {
        var strHelloWorld: String?
        XCTAssertNil(strHelloWorld)
    
        strHelloWorld = "Hello world"
        
        //this test will fail
        //XCTAssertEqual(strHelloWorld, "Hello word")
        
        //this test will pass
        XCTAssertEqual(strHelloWorld, "Hello world")
    }
}
