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
    
    /// The type that can have any `to` chains chained to it.
    var to: TestItemContainer<ItemType> { get }
    // I want to use the `Toable` protocol here but swift doesn't support that kind of thing yet.
}
