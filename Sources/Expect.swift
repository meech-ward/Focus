//
//  Expect.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2017-02-03.
//
//

import Foundation

public class Expect<Item>: TestItemContainer<Item>, Expectable {
    public typealias ItemType = Item
}
