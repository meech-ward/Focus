//
//  Expectable.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2017-01-20.
//
//

import Foundation

public protocol Expectable: TestItemContainerType {
    
    associatedtype ItemType
}

public extension Expectable {
    
    /// to
    internal var to: To<ItemType> {
        return To(item: item)
    }
    // I want to use the `Toable` protocol here but swift doesn't support that kind of thing yet.
}

