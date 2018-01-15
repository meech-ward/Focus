//
//  WhenTestingSomethingToBeEqual.swift
//  FocusPackageDescription
//
//  Created by Sam Meech-Ward on 2018-01-14.
//
@testable import Focus
import XCTest

class WhenTestingSomethingToEqual: XCTestCase {
  
  func toable<ItemType>(item: ItemType) -> To<ItemType> {
    return Expect(item: item).to
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
  
  func assertEqual<ItemType: Equatable>(item1: ItemType, item2: ItemType) {
    let to = toable(item: item1)
    
    to.equal(item2)
    
    XCTAssertTrue(reporter.successData.used)
    XCTAssertFalse(reporter.failureData.used)
  }
  
  func assertNotEqual<ItemType: Equatable>(item1: ItemType, item2: ItemType) {
    let to = toable(item: item1)
    
    to.equal(item2)
    
    XCTAssertFalse(reporter.successData.used)
    XCTAssertTrue(reporter.failureData.used)
  }
  
  func test_To_Equal_Passes_GivenTwoEqualInts() {
    assertEqual(item1: 0, item2: 0)
    assertEqual(item1: 1, item2: 1)
    assertEqual(item1: 420, item2: 420)
  }
  
  func test_To_Equal_Passes_GivenTwoEqualStrings() {
    assertEqual(item1: "", item2: "")
    assertEqual(item1: "1", item2: "1")
    assertEqual(item1: "🤗", item2: "🤗")
  }
  
  func test_To_Equal_Fails_GivenTwoEqualInts() {
    assertNotEqual(item1: 0, item2: 1)
    assertNotEqual(item1: 3.14, item2: 420)
  }
  
  func test_To_Equal_Fails_GivenTwoUnEqualStrings() {
    assertNotEqual(item1: "", item2: "1")
    assertNotEqual(item1: "💩", item2: "🤗")
  }
}
