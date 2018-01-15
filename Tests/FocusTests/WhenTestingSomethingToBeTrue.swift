//
//  WhenTestingSomethingToBeTrue.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//
@testable import Focus
import XCTest

class WhenTestingSomethingToBeTrue: XCTestCase {
    
    func beable<ItemType>(item: ItemType) -> Be<ItemType> /*Beable<ItemType>*/ {
        return Expect(item: item).to.be
    }
    
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

    func test_Be_True_PassesWhenBoolIsTrue() {
        let be = beable(item: true)

        be.true()
        
        XCTAssertTrue(reporter.successData.used)
        XCTAssertFalse(reporter.failureData.used)
    }
    
    func test_Be_True_FailesWhenBoolIsFalse() {
        let be = beable(item: false)
        
        be.true()
        
        XCTAssertFalse(reporter.successData.used)
        XCTAssertTrue(reporter.failureData.used)
    }
    
    func test_Be_True_FailesWhenNonBoolIsPassedIn() {
        let be = beable(item: customTestBoolen(booleanLiteral: true))
        
        be.true()
        
        XCTAssertFalse(reporter.successData.used)
        XCTAssertTrue(reporter.failureData.used)
    }
}
