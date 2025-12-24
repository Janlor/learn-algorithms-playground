//
//  MiddleNodeTest.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/24.
//

import XCTest

@testable import LeetCodePackage

final class MiddleNodeTest: XCTestCase {

    var solver: MiddleNode!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        solver = MiddleNode()
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
        
        let node10 = ListNode.arrToLinkedList(arr: [1,2,3,4,5])
        let node11 = solver.middleNode2(node10)
        let array11 = ListNode.listToArray(node11)
        XCTAssertEqual(array11, [3,4,5])
        
        let node20 = ListNode.arrToLinkedList(arr: [1,2,3,4,5,6])
        let node21 = solver.middleNode2(node20)
        let array21 = ListNode.listToArray(node21)
        XCTAssertEqual(array21, [4,5,6])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
