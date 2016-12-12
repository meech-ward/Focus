//
//  WhenCreatingAToObject.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-11.
//
//
@testable import Focus
import XCTest

class WhenCreatingAToObject: XCTestCase {
    
    override func setUp() {
        
    }

    func testToObjectSavesInputItem() {
        let someString = "some string"
        let focusTo = FocusTo(item: someString)
        
        XCTAssertEqual(focusTo.item, someString)
    }
    
//    func testToIsTrue() {
//        let someBool = true
//        let focusTo = FocusTo<Bool>(item: someBool)
//        
//        focusTo.beTrue()
//    }

}
