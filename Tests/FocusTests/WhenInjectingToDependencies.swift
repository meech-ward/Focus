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

    var reporter: Reporter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        reporter = Reporter()
        reporter.resetData()
        Focus.reporter = reporter
    }
    
    func toable<Item>(item: Item) -> To<Item> {
        return expect(item).to
    }
    
    // MARK: Failure Dependency

    func test_To_UsesFailureDependency() {
        let test = toable(item: "item")
        test.fail()
        
        let failureDependencyUsed = reporter.failureData.used
        let successDependencyUsed = reporter.successData.used
        
        XCTAssertTrue(failureDependencyUsed)
        XCTAssertFalse(successDependencyUsed)
    }
    
    func test_To_PassesFailureDependencyFileAndLineNumber() {
        let test = toable(item: "item")
        test.fail()
        let expectedLine: UInt = #line-1
        let expectedFile = #file
        let expectedMethod = #function
        
        XCTAssertEqual(reporter.failureData.file, expectedFile)
        XCTAssertEqual(reporter.failureData.line, expectedLine)
        XCTAssertEqual(reporter.failureData.method, expectedMethod)
    }
    
    func test_To_PassesFailureDependencyMessage() {
        let inputMessage = "Test Message"
        
        let test = toable(item: "item")
        test.fail(inputMessage)

        XCTAssertEqual(inputMessage, reporter.failureData.comment)
    }
    
    // MARK: Success Dependency
    
    func test_To_UsesSuccessDependency() {
        let test = toable(item: "item")
        test.pass()
        
        let failureDependencyUsed = reporter.failureData.used
        let successDependencyUsed = reporter.successData.used
        
        XCTAssertFalse(failureDependencyUsed)
        XCTAssertTrue(successDependencyUsed)
    }
    
    func test_To_PassesSuccessDependencyFileAndLineNumber() {
        let test = toable(item: "item")
        test.pass()
        let expectedLine: UInt = #line-1
        let expectedFile = #file
        let expectedMethod = #function
        
        XCTAssertEqual(reporter.successData.file, expectedFile)
        XCTAssertEqual(reporter.successData.line, expectedLine)
        XCTAssertEqual(reporter.successData.method, expectedMethod)
    }
}
