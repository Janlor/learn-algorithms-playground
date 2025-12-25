//
//  PivotIndexTest.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/25.
//

import XCTest

@testable import LeetCodePackage

final class PivotIndexTest: XCTestCase {

    var solver: PivotIndex!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        solver = PivotIndex()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        XCTAssertEqual(solver.pivotIndex([1, 7, 3, 6, 5, 6]), 3)
        XCTAssertEqual(solver.pivotIndex([1, 2, 3]), -1)
        XCTAssertEqual(solver.pivotIndex([2, 1, -1]), 0)
        XCTAssertEqual(solver.pivotIndex([-1,-1,-1,-1,0,1]), 1)
//        XCTAssertEqual(solver.pivotIndex([-1,-1,-1,-1,-1,-1]), -1)
        
        XCTAssertEqual(solver.pivotIndex2([1, 7, 3, 6, 5, 6]), 3)
        XCTAssertEqual(solver.pivotIndex2([1, 2, 3]), -1)
        XCTAssertEqual(solver.pivotIndex2([2, 1, -1]), 0)
        XCTAssertEqual(solver.pivotIndex2([-1,-1,-1,-1,0,1]), 1)
        XCTAssertEqual(solver.pivotIndex2([-1,-1,-1,-1,-1,-1]), -1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
