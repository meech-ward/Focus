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
    
    func beable<ItemType>(item: ItemType) -> TestItemContainer<ItemType> {
        return TestItemContainer(item: item)
    }
    
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

    func test_Be_True_PassesWhenBoolIsTrue() {
        let be = beable(item: true)

        be.true()
        
        XCTAssertTrue(successData.used)
        XCTAssertFalse(failureData.used)
    }
    
    func test_Be_True_FailesWhenBoolIsFalse() {
        let be = beable(item: false)
        
        be.true()
        
        XCTAssertFalse(successData.used)
        XCTAssertTrue(failureData.used)
    }
    
    func test_Be_True_FailesWhenNonBoolIsPassedIn() {
        let be = beable(item: customTestBoolen(booleanLiteral: true))
        
        be.true()
        
        XCTAssertFalse(successData.used)
        XCTAssertTrue(failureData.used)
    }
    
    func test_Be_True_UsesFileAndLineNumberWhenSuccessful() {
        let be = beable(item: true)
        let comment = "🖕🏼 Item is not true"
        
        be.true(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(successData.file, expectedFile)
        XCTAssertEqual(successData.line, expectedLine)
    }
    
    func test_Be_True_UsesCommentFileAndLineNumberWhenFailes() {
        let be = beable(item: false)
        let comment = "🖕🏼 Item is not true"
        
        be.true(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(failureData.file, expectedFile)
        XCTAssertEqual(failureData.line, expectedLine)
        XCTAssertEqual(failureData.comment, comment)
    }

    func test_Be_True_UsesCommentFileAndLineNumberWhenFailesBecauseNonBoolIsPassedIn() {
        let be = beable(item: customTestBoolen(booleanLiteral: true))
        let comment = "🖕🏼 Item is not true"
        
        be.true(comment)
        
        let expectedLine: UInt = #line-2
        let expectedFile = #file
        
        XCTAssertEqual(failureData.file, expectedFile)
        XCTAssertEqual(failureData.line, expectedLine)
        XCTAssertEqual(failureData.comment, comment)
    }
}
