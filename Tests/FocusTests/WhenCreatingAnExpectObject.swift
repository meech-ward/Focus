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
    
    var failureData:(used: Bool, comment: String, file: String, line: UInt) = (false, "", "", 0)
    var successData:(used: Bool, file: String, line: UInt) = (false, "", 0)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        failureData = (false, "", "", 0)
        successData = (false, "", 0)
        
        Focus.failureHandler = { message, file, line in
            self.failureData = (used: true, comment: message, file: String(describing: file), line: line)
        }
        
        Focus.successHandler = { file, line in
            self.successData = (used: true, file: String(describing: file), line: line)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_ExpectObject_HasAValidToObject() {
        let focusExpect = expect()
        
        XCTAssertNotNil(focusExpect.to)
    }
    
    func test_ExpectObject_PassesTheInputObjetToTo() {
        let item = "Some Item"
        let focusExpect = expect(item)
        
        XCTAssertEqual(item, focusExpect.to.item)
    }

    
    func test_expect_UsesFileAndLineNumberWhenSuccessful() {
        let comment = "🖕🏼 Item is not true"
        
        expect(true).to.beTrue(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(successData.file, expectedFile)
        XCTAssertEqual(successData.line, expectedLine)
    }
    
    func test_expect_UsesCommentFileAndLineNumberWhenFailes() {
        let comment = "🖕🏼 Item is not true"
        
        expect(false).to.beTrue(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(failureData.file, expectedFile)
        XCTAssertEqual(failureData.line, expectedLine)
        XCTAssertEqual(failureData.comment, comment)
    }
    
    func test_expect_UsesCommentFileAndLineNumberWhenFailesBecauseNonBoolIsPassedIn() {
        let comment = "🖕🏼 Item is not true"
        
        expect(customTestBoolen(booleanLiteral: true)).to.beTrue(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(failureData.file, expectedFile)
        XCTAssertEqual(failureData.line, expectedLine)
        XCTAssertEqual(failureData.comment, comment)
    }

}
