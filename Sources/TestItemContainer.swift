//
//  TestItemContainer.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2017-02-03.
//
//

import Foundation

public class TestItemContainer<Item>: TestItemContainerType {
    
    public var item: Item {
        return _item
    }
    private var _item: Item!
    
    public required init(item: Item) {
        _item = item
    }
    
    public var failureHandler = Focus.failureHandler
    
    public var successHandler = Focus.successHandler
    
}
