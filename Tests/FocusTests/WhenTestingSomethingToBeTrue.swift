//
//  WhenTestingSomethingToBeTrue.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//
@testable import Focus
import XCTest

struct customTestBoolen: ExpressibleByBooleanLiteral {
    init(booleanLiteral value: Bool) {
    }
}

class WhenTestingSomethingToBeTrue: XCTestCase {
    
    var failureData = (used: Bool, comment: String, file: String, line: UInt)(false, "", "", 0)
    var successData = (used: Bool, file: String, line: UInt)(false, "", 0)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        failureData = (used: Bool, comment: String, file: String, line: UInt)(false, "", "", 0)
        successData = (used: Bool, file: String, line: UInt)(false, "", 0)

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

    func test_FocusTo_BeTrue_PassesWhenBoolIsTrue() {
        let focusTo = FocusTo<Bool>(item: true)

        focusTo.beTrue()
        
        XCTAssertTrue(successData.used)
        XCTAssertFalse(failureData.used)
    }
    
    func test_FocusTo_BeTrue_FailesWhenBoolIsFalse() {
        let focusTo = FocusTo(item: false)
        
        focusTo.beTrue()
        
        XCTAssertFalse(successData.used)
        XCTAssertTrue(failureData.used)
    }
    
    func test_FocusTo_BeTrue_FailesWhenNonBoolIsPassedIn() {
        let focusTo = FocusTo(item: customTestBoolen(booleanLiteral: true))
        
        focusTo.beTrue()
        
        XCTAssertFalse(successData.used)
        XCTAssertTrue(failureData.used)
    }
    
    func test_FocusTo_BeTrue_UsesFileAndLineNumberWhenSuccessful() {
        let focusTo = FocusTo<Bool>(item: true)
        let comment = "🖕🏼 Item is not true"
        
        focusTo.beTrue(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(successData.file, expectedFile)
        XCTAssertEqual(successData.line, expectedLine)
    }
    
    func test_FocusTo_BeTrue_UsesCommentFileAndLineNumberWhenFailes() {
        let focusTo = FocusTo<Bool>(item: false)
        let comment = "🖕🏼 Item is not true"
        
        focusTo.beTrue(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(failureData.file, expectedFile)
        XCTAssertEqual(failureData.line, expectedLine)
        XCTAssertEqual(failureData.comment, comment)
    }

    func test_FocusTo_BeTrue_UsesCommentFileAndLineNumberWhenFailesBecauseNonBoolIsPassedIn() {
        let focusTo = FocusTo(item: customTestBoolen(booleanLiteral: true))
        let comment = "🖕🏼 Item is not true"
        
        focusTo.beTrue(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(failureData.file, expectedFile)
        XCTAssertEqual(failureData.line, expectedLine)
        XCTAssertEqual(failureData.comment, comment)
    }
}
