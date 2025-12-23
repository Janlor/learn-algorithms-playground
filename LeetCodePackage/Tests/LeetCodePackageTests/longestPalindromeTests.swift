//
//  longestPalindromeTests.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/23.
//

import XCTest

@testable import LeetCodePackage

final class longestPalindromeTests: XCTestCase {

    var solver: LongestPalindrome!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        solver = LongestPalindrome()
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
        XCTAssertEqual(solver.longestPalindrome("abccccdd"), 7)
        XCTAssertEqual(solver.longestPalindrome("a"), 1)
        XCTAssertEqual(solver.longestPalindrome("ccc"), 3)
        XCTAssertEqual(solver.longestPalindrome("cccaaa"), 5)
        
        XCTAssertEqual(solver.longestPalindrome2("abccccdd"), 7)
        XCTAssertEqual(solver.longestPalindrome2("a"), 1)
        XCTAssertEqual(solver.longestPalindrome2("ccc"), 3)
        XCTAssertEqual(solver.longestPalindrome2("cccaaa"), 5)
        
        XCTAssertEqual(solver.longestPalindrome3("abccccdd"), 7)
        XCTAssertEqual(solver.longestPalindrome3("a"), 1)
        XCTAssertEqual(solver.longestPalindrome3("ccc"), 3)
        XCTAssertEqual(solver.longestPalindrome3("cccaaa"), 5)
        
        XCTAssertEqual(solver.longestPalindrome4("abccccdd"), 7)
        XCTAssertEqual(solver.longestPalindrome4("a"), 1)
        XCTAssertEqual(solver.longestPalindrome4("ccc"), 3)
        XCTAssertEqual(solver.longestPalindrome4("cccaaa"), 5)
        
        XCTAssertEqual(solver.longestPalindrome5("abccccdd"), 7)
        XCTAssertEqual(solver.longestPalindrome5("a"), 1)
        XCTAssertEqual(solver.longestPalindrome5("ccc"), 3)
        XCTAssertEqual(solver.longestPalindrome5("cccaaa"), 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
