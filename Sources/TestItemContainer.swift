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
    
    public var failureHandler = Focus.failureHandler
    
    public var successHandler: ((StaticString, UInt) -> (Void))? = Focus.successHandler
}

extension TestItemContainer: Expectable {
}

extension TestItemContainer: Toable {
}

extension TestItemContainer: Beable {
}
