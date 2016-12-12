//
//  FocusTo.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

struct FocusTo<Item> {
    
    var item: Item!
    
    init(item: Item) {
        self.item = item
    }
    
    func fail(_ message: String = "😡", file: StaticString = #file, line: UInt = #line) {
        Focus.failureHandler?(message, file, line)
    }
    
    func pass(_ message: String = "😡", file: StaticString = #file, line: UInt = #line) {
        Focus.successHandler?(message, file, line)
    }
    
}
