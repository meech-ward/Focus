//
//  Toable.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-18.
//
//

import Foundation

public protocol Toable: TestItemContainerType {
  
}

public extension Toable {
  
  /// The type that can have any `be` chains chained to it.
  public var be: Be<ItemType> {
    return Be(item: item)
  }
  
  // I want to use the `Beable` protocol here but swift doesn't support that kind of thing yet. As of swift 3
  
}
