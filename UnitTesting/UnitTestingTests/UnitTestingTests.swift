//
//  UnitTestingTests.swift
//  UnitTestingTests
//
//  Created by webwerks on 27/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import XCTest

class UnitTestingTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }

//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    sessionUnderTest = nil
//        //provides an opportunity to perform cleanup after each test method in a test case ends
//        super.tearDown()
//    }
    
    //Asynchronous test: success fast, failure slow
    func test_ValidTestCallStatus200() {
        //given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        //1
        let promise = expectation(description: "status code 200")
        //when
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            //then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            }
            else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                }
                else{
                    XCTFail("Status Code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_APIComplition() {
        //given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let promise = expectation(description: "Complition handler invoked")
        var statusCode: Int?
        var responseError: Error?

        //when
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error

            promise.fulfill()
        }

        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        //then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
