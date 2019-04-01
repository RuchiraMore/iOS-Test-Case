//
//  UnitTestingUITests.swift
//  UnitTestingUITests
//
//  Created by webwerks on 28/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import XCTest

class UnitTestingUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_LoginSuccess() {
        let validUsername = "abc"
        let validPassword = "abc"
        
        let app = XCUIApplication()
        let txtUsername = app.textFields["username"]
        //this checks textfield is exists or not
        XCTAssertTrue(txtUsername.exists)
        txtUsername.tap()
        txtUsername.typeText(validUsername)
        
        let txtPassword = app.textFields["password"]
        XCTAssertTrue(txtPassword.exists)
        txtPassword.tap()
        txtPassword.typeText(validPassword)
        
        //select Simultor --> Hardware --> Keyboard --> Keep On "Toggle keyboard on"
        app.buttons["Login"].tap()
        
        //Invalid Login Case
        app.alerts["Invalid credential"].buttons["Okay"].tap()
        
        //Valid Login Case
        //app.alerts["Logged In"].buttons["Okay"].tap()

    }
    
    func test_ValidLogInSuccess() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let validUsername = "abc"
        let validPassword = "abc"
        
        let app = XCUIApplication()
        
        // this code automatically generates when you run "Record UI Test", after that use as per requirement
//        app.textFields["username"].tap()
//        app.textFields["password"].tap()
//        app.buttons["Login"].tap()
//        app.alerts["Invalid credential"].buttons["Okay"].tap()
        
        
        let txtUsername = app.textFields["username"]
        //this checks textfield is exists or not
        XCTAssertTrue(txtUsername.exists)
        txtUsername.tap()
        txtUsername.typeText(validUsername)
        
        let txtPassword = app.textFields["password"]
        XCTAssertTrue(txtPassword.exists)
        txtPassword.tap()
        txtPassword.typeText(validPassword)
        
        //select Simultor --> Hardware --> Keyboard --> Keep On "Toggle keyboard on"
        app.buttons["Login"].tap()
        app.alerts["Logged In"].buttons["Okay"].tap()
        
    }
    
}
