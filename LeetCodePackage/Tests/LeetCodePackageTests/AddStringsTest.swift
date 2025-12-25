//
//  AddStringsTest.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/25.
//

import XCTest

@testable import LeetCodePackage

final class AddStringsTest: XCTestCase {

    var solver: AddStrings!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        solver = AddStrings()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        solver = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssertEqual(solver.addStrings1("1", "9"), "10")
        XCTAssertEqual(solver.addStrings1("11", "123"), "134")
        XCTAssertEqual(solver.addStrings1("456", "77"), "533")
        XCTAssertEqual(solver.addStrings1("0", "0"), "0")
        
        XCTAssertEqual(solver.addStrings("1", "9"), "10")
        XCTAssertEqual(solver.addStrings("11", "123"), "134")
        XCTAssertEqual(solver.addStrings("456", "77"), "533")
        XCTAssertEqual(solver.addStrings("0", "0"), "0")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
