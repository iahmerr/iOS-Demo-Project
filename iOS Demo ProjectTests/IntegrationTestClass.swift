//
//  IntegrationTestClass.swift
//  iOS Demo ProjectTests
//
//  Created by Ahmer Hassan on 13/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import XCTest
@testable import iOS_Demo_Project

class IntegrationTestClass: XCTestCase {

    let apiCall = FetchData()
    let controller = UIViewController()
    
    func test_checkConnectivity_Success() {
        XCTAssertNotNil(controller.checkConnectivity())
        XCTAssertTrue(controller.checkConnectivity())
        
    }
    
    func test_CheckConnectivity_Failure() {
        XCTAssertNotNil(controller.checkConnectivity())
        XCTAssertFalse(controller.checkConnectivity())
    }
   func test_productsResource_with_validResponse() {
       //Arrange
       
       
       let expectation = self.expectation(description: "API Response")
       apiCall.getHomeProducts(resultType: ProductsResponse.self) { (response) in
           XCTAssertNotNil(response)
           XCTAssertEqual(response?.results?[0].name, "Notebook")
           expectation.fulfill()
       }
       
       waitForExpectations(timeout: 15) { (err) in
           print(err?.localizedDescription as Any)
       }
   }
   
   func test_productResource_with_invalidResponse() {
       let expectation = self.expectation(description: "API Response- Invalid")
       apiCall.getHomeProducts(resultType: Results.self) { (response) in
           XCTAssertNil(response?.created_at)
           XCTAssertNil(response?.name)
           XCTAssertNil(response?.image_ids)
           expectation.fulfill()
       }
       
       waitForExpectations(timeout: 15) { (err) in
           print(err?.localizedDescription as Any)
       }
   }

}
