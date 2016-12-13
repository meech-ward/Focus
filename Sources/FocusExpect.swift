//
//  FocusExpect.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

public struct FocusExpect<Item> {
    
    public var to: FocusTo<Item> {
        return _to
    }
    private let _to: FocusTo<Item>!
    
    init(item: Item) {
        _to = FocusTo(item: item)
    }
}
