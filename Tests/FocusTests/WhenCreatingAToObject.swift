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

    func testToObjectSavesInputItem() {
        let someString = "some string"
        let focusTo = FocusTo(item: someString)
        
        XCTAssertEqual(focusTo.item, someString)
    }
    
    func testToIsTrue() {
        
    }

}
