//
//  WhenLoggingOutput.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2017-03-01.
//
//
import Focus
import XCTest


class TestReporter: Reportable {
    
    var file: String?
    var method: String?
    var line: UInt?
    var message: String?
    var evaluation: String?
    
    func testFailed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        
        self.file = String(describing: file)
        self.method = method
        self.line = line
        self.message = message
        self.evaluation = evaluation
    }
    
    func testPassed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        
        self.file = String(describing: file)
        self.method = method
        self.line = line
        self.message = message
        self.evaluation = evaluation
    }
}

class WhenLoggingOutput: XCTestCase {
    
    var reporter: TestReporter!
    
    override func setUp() {
        super.setUp()
        
        self.reporter = TestReporter()
        Focus.set(reporter: reporter)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func assertTestReporterPropertiesAreSet(reporter: TestReporter?) {
        guard let reporter = reporter else {
            XCTFail("reporter is nil")
            return
        }
        XCTAssertNotNil(reporter.file)
        XCTAssertNotNil(reporter.method)
        XCTAssertNotNil(reporter.line)
        XCTAssertNotNil(reporter.message)
        XCTAssertNotNil(reporter.evaluation)
    }
    
    func test_passingTest_triggers_willRun() {
        expect(true).to.be.true()
        
        assertTestReporterPropertiesAreSet(reporter: self.reporter)
    }
    
    func test_failingTest_triggers_willRun() {
        expect(false).to.be.true()
        
        assertTestReporterPropertiesAreSet(reporter: self.reporter)
    }
    
    func test_failingTest_reporter_message() {
        let message = "my message"
        expect(false).to.be.true(message)
        
        XCTAssertEqual(self.reporter?.message, message)
    }
    
    func test_passingTest_reporter_message() {
        let message = "my message"
        expect(true).to.be.true(message)
        
        XCTAssertEqual(self.reporter?.message, message)
    }
    
    func test_passingTest_reporter_method() {
        expect(true).to.be.true("")
        
        XCTAssertEqual(self.reporter?.method, "test_passingTest_reporter_method()")
    }
    
}
