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
    internal var _item: Item!
    
    public required init(item: Item) {
        _item = item
    }
    
    public var reporter: Reportable? = Focus.reporter
    
}
