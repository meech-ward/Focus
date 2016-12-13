//
//  FocusTo.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

public struct FocusTo<Item> {
    
    internal var item: Item!
    
    init(item: Item) {
        self.item = item
    }
    
    public func fail(_ message: String = "😡", file: StaticString = #file, line: UInt = #line) {
        Focus.failureHandler?(message, file, line)
    }
    
    public func pass(file: StaticString = #file, line: UInt = #line) {
        Focus.successHandler?(file, line)
    }
    
}
