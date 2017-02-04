//
//  Toable.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-18.
//
//

import Foundation

public protocol Toable: TestItemContainerType {
    
    associatedtype ItemType
    
//    var be: Any { get }
}

public extension Toable where Self: Beable {
 
    /// The type that can have any `be` chains chained to it.
    var be: Self {
        return self
    }
    // I want to use the `Beable` protocol here but swift doesn't support that kind of thing yet.
}
