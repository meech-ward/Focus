//
//  Expect.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

public struct TestItemContainer<Item>: TestItemContainerType {
    
    public var item: Item {
        return _item
    }
    private var _item: Item!
    
    public init(item: Item) {
        _item = item
    }
    
    public func fail(_ message: String = "😡", file: StaticString = #file, line: UInt = #line) {
        Focus.failureHandler?(message, file, line)
    }
    
    public func pass(file: StaticString = #file, line: UInt = #line) {
        Focus.successHandler?(file, line)
    }
}

extension TestItemContainer: Expectable {
    public var to: TestItemContainer<Item> {
        return self
    }
}

extension TestItemContainer: Toable {
    public var be: TestItemContainer<Item> {
        return self
    }
}

extension TestItemContainer: Beable {

}
