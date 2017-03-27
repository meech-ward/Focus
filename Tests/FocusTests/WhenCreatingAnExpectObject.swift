//
//  WhenCreatingAnExpectObject.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-11.
//
//
@testable import Focus
import XCTest

class WhenCreatingAnExpectObject: XCTestCase {
    
    var reporter: Reporter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        reporter = Reporter()
        reporter.resetData()
        Focus.reporter = reporter
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_ExpectObject_HasAValidItemObject() {
        let focusExpect = expect()
        
        XCTAssertNotNil(focusExpect.item)
    }
    
    func test_expect_UsesFileAndLineNumberWhenSuccessful() {
        let comment = "🖕🏼 Item is not true"
        
        expect(true).to.be.true(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(reporter.successData.file, expectedFile)
        XCTAssertEqual(reporter.successData.line, expectedLine)
    }
    
    func test_expect_UsesCommentFileAndLineNumberWhenFailes() {
        let comment = "🖕🏼 Item is not true"
        
        expect(false).to.be.true(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(reporter.failureData.file, expectedFile)
        XCTAssertEqual(reporter.failureData.line, expectedLine)
        XCTAssertEqual(reporter.failureData.comment, comment)
    }
    
    func test_expect_UsesCommentFileAndLineNumberWhenFailesBecauseNonBoolIsPassedIn() {
        let comment = "🖕🏼 Item is not true"
        
        expect(customTestBoolen(booleanLiteral: true)).to.be.true(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(reporter.failureData.file, expectedFile)
        XCTAssertEqual(reporter.failureData.line, expectedLine)
        XCTAssertEqual(reporter.failureData.comment, comment)
    }

}
