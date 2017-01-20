//
//  WhenInjectingToDependencies.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//
@testable import Focus
import XCTest

class WhenInjectingToDependencies: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        Focus.failureHandler = nil
        Focus.successHandler = nil
        
        super.tearDown()
    }
    
    // MARK: Failure Dependency

    func testToUsesFailureDependency() {
        var failureDependencyUsed = false
        Focus.failureHandler = { message, file, line in
            failureDependencyUsed = true
        }
        
        var successDependencyUsed = false
        Focus.successHandler = { file, line in
            successDependencyUsed = true
        }
        
        let test = TestItemContainer(item: "item")
        test.fail()
        
        XCTAssertTrue(failureDependencyUsed)
        XCTAssertFalse(successDependencyUsed)
    }
    
    func testToPassesFailureDependencyFileAndLineNumber() {
        var data = (file: String, line: UInt)("", 0)
        Focus.failureHandler = { message, file, line in
            data.file = String(describing: file)
            data.line = line
        }
        
        let test = TestItemContainer(item: "item")
        test.fail()
        let expectedLine: UInt = #line-1
        let expectedFile = #file
        
        XCTAssertEqual(data.file, expectedFile)
        XCTAssertEqual(data.line, expectedLine)
    }
    
    func testToPassesFailureDependencyMessage() {
        let inputMessage = "Test Message"
        var outputMessage: String!
        Focus.failureHandler = { message, file, line in
            outputMessage = message
        }
        
        let test = TestItemContainer(item: "item")
        test.fail(inputMessage)

        XCTAssertEqual(inputMessage, outputMessage)
    }
    
    // MARK: Success Dependency
    
    func test_To_UsesSuccessDependency() {
        var failureDependencyUsed = false
        Focus.failureHandler = { message, file, line in
            failureDependencyUsed = true
        }
        
        var successDependencyUsed = false
        Focus.successHandler = { file, line in
            successDependencyUsed = true
        }
        
        let test = TestItemContainer(item: "item")
        test.pass()
        
        XCTAssertFalse(failureDependencyUsed)
        XCTAssertTrue(successDependencyUsed)
    }
    
    func testToPassesSuccessDependencyFileAndLineNumber() {
        var data = (file: String, line: UInt)("", 0)
        Focus.successHandler = { file, line in
            data.file = String(describing: file)
            data.line = line
        }
        
        let test = TestItemContainer(item: "item")
        test.pass()
        let expectedLine: UInt = #line-1
        let expectedFile = #file
        
        XCTAssertEqual(data.file, expectedFile)
        XCTAssertEqual(data.line, expectedLine)
    }
}
