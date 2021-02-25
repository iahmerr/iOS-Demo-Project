//
//  iOS_Demo_ProjectUITests.swift
//  iOS Demo ProjectUITests
//
//  Created by Ahmer Hassan on 11/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import XCTest
@testable import iOS_Demo_Project

class iOS_Demo_ProjectUITests: XCTestCase {
    
   
    let fetchData = FetchData()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_TableViewHomeController() {
        
        let app = XCUIApplication()
        app.launch()
         let checkExpectation = self.expectation(description: "Testing after API Call")
        self.fetchData.getHomeProducts(resultType: ProductsResponse.self) { (result) in
            
            XCTAssertEqual(app.tables.cells.count, 10)
                   app.tables.staticTexts["table lamp"].swipeUp()
                   XCTAssertEqual(app.buttons.count, 0)
            
        }
       
       
        
        checkExpectation.fulfill()
        waitForExpectations(timeout: 15, handler: nil)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
