//
//  bayut_testTests.swift
//  bayut-testTests
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import XCTest
@testable import bayut_test

class bayut_testTests: XCTestCase {
    
    let timeout = 25.0

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetProducts() {
        let expectation = self.expectation(description: "Get Products")
        
        APIClient.fetchProducts { (response, error) in
            guard let response = response else { return }
            XCTAssertGreaterThan(response.data.count, 0)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: timeout)
    }

}
