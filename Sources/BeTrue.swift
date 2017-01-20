//
//  ToBeTrue.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

public extension Beable where ItemType: ExpressibleByBooleanLiteral {
    
    /**
     Compare any boolean to the value `true`
     
     - parameter message: The message to be output if the comparison fails.
     - parameter file: The file that this method was called from.
     - parameter line: The line number that this method was called from.
    */
    public func `true`(_ message: String = "Item is not true", file: StaticString = #file, line: UInt = #line) {
        guard let item = item as? Bool else {
            self.fail(message, file: file, line: line)
            return
        }
        
        guard item == true else {
            self.fail(message, file: file, line: line)
            return
        }
        
        self.pass(file: file, line: line)
    }
    
}
