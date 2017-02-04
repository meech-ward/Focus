//
//  TestObjectType.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2017-01-20.
//
//

import Foundation

public protocol TestItemContainerType {
    
    associatedtype ItemType
    
    /// The item that all comparisons will be done on.
    var item: ItemType { get }
    
    /**
     Initialize an new instance with the item.
     */
    init(item: ItemType)

    /**
     Fail without doing any comparisons.
     This would get called if a comparison was not true.
     
     - parameter message: The message to be output when the failure happens.
     - parameter file: The file that this method was called from.
     - parameter line: The line number that this method was called from.
     */
    var failureHandler: ((_ message: String, _ file: StaticString, _ line: UInt) -> (Void))? { get set }
    
    /**
     Pass without doing any comparisons.
     This would get called if a comparison was true.
     
     - parameter file: The file that this method was called from.
     - parameter line: The line number that this method was called from.
     */
    var successHandler: ((_ file: StaticString, _ line: UInt) -> (Void))? { get set }
}

public extension TestItemContainerType {
    /**
     Fail without doing any comparisons.
     This would get called if a comparison was not true.
     
     - parameter message: The message to be output when the failure happens.
     - parameter file: The file that this method was called from.
     - parameter line: The line number that this method was called from.
     */
    func fail(_ message: String = "😡", file: StaticString = #file, line: UInt = #line) {
        self.failureHandler?(message, file, line)
    }
    
    /**
     Pass without doing any comparisons.
     This would get called if a comparison was true.
     
     - parameter file: The file that this method was called from.
     - parameter line: The line number that this method was called from.
     */
    func pass(file: StaticString = #file, line: UInt = #line) {
        self.successHandler?(file, line)
    }
}

