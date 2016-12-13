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
    var successData = (used: Bool, comment: String, file: String, line: UInt)(false, "", "", 0)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        failureData = (used: Bool, comment: String, file: String, line: UInt)(false, "", "", 0)
        successData = (used: Bool, comment: String, file: String, line: UInt)(false, "", "", 0)

        Focus.failureHandler = { message, file, line in
            self.failureData = (used: true, comment: message, file: String(describing: file), line: line)
        }
        
        Focus.successHandler = { message, file, line in
            self.successData = (used: true, comment: message, file: String(describing: file), line: line)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testToBeTrue() {
        let focusTo = FocusTo<Bool>(item: true)

        focusTo.beTrue()
        
        XCTAssertTrue(successData.used)
        XCTAssertFalse(failureData.used)
    }
    
    func testFocusToNotBeTrue() {
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
    
//    func testFocusToBeTrueUsesCommentFileAndLineNumber() {
//        var data = (file: String, line: UInt)("", 0)
//        Focus.failureHandler = { message, file, line in
//            data.file = String(describing: file)
//            data.line = line
//        }
//        
//        let focusTo = FocusTo(item: "item")
//        focusTo.fail()
//        let expectedLine: UInt = #line-1
//        let expectedFile = #file
//        
//        XCTAssertEqual(data.file, expectedFile)
//        XCTAssertEqual(data.line, expectedLine)
//    }
//    
//    func testFocusToBeNotTrueUsesCommentFileAndLineNumber() {
//        
//    }
}
