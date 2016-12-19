//
//  Expect.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

public struct Expect<Item> {
    
    public var to: To<Item> {
        return _to
    }
    private let _to: To<Item>!
    
    init(item: Item) {
        _to = To(item: item)
    }
}
