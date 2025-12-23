//
//  IsomorphicTests.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/23.
//

import XCTest

@testable import LeetCodePackage

final class IsomorphicTests: XCTestCase {

    var solver: Isomorphic!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        solver = Isomorphic()
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
        XCTAssertFalse(solver.isIsomorphic("badc", "baba"))
        XCTAssertTrue(solver.isIsomorphic("paper", "title"))
        XCTAssertTrue(solver.isIsomorphic("egg", "add"))
        XCTAssertFalse(solver.isIsomorphic("foo", "bar"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
