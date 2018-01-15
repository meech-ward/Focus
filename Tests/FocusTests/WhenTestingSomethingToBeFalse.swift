//
//  WhenTestingSomethingToBeFalse.swift
//  FocusTests
//
//  Created by Sam Meech-Ward on 2018-01-14.
//
@testable import Focus
import XCTest

class WhenTestingSomethingToBeFalse: XCTestCase {
  
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
  
  func test_Be_False_FailsWhenBoolIsTrue() {
    let be = beable(item: true)
    
    be.false()
    
    XCTAssertFalse(reporter.successData.used)
    XCTAssertTrue(reporter.failureData.used)
  }
  
  func test_Be_False_PassesWhenBoolIsFalse() {
    let be = beable(item: false)
    
    be.false()
    
    XCTAssertTrue(reporter.successData.used)
    XCTAssertFalse(reporter.failureData.used)
  }
  
  func test_Be_False_FailesWhenNonBoolIsPassedIn() {
    let be = beable(item: customTestBoolen(booleanLiteral: false))
    
    be.false()
    
    XCTAssertFalse(reporter.successData.used)
    XCTAssertTrue(reporter.failureData.used)
  }
}
