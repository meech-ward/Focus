//
//  Expectable.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-19.
//
//

import Foundation

public protocol Expectable {
    
    associatedtype ItemType
    
    /**
     Initialize an new instance with the item.
     */
    init(item: ItemType)
}
