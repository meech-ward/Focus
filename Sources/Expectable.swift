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

public extension Toable where Self: Toable {
    
    /// The type that can have any `be` chains chained to it.
    var to: Self {
        return self
    }
    // I want to use the `Beable` protocol here but swift doesn't support that kind of thing yet.
}
