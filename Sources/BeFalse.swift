//
//  BeFalse.swift
//  FocusPackageDescription
//
//  Created by Sam Meech-Ward on 2018-01-14.
//

import Foundation

public extension Beable where ItemType: ExpressibleByBooleanLiteral {
  
  /**
   Compare any boolean to the value `false`
   `item == false`
   
   - parameter message: The message to be output if the comparison fails.
   - parameter file: The file that this method was called from.
   - parameter line: The line number that this method was called from.
   */
  public func `false`(_ message: String = "Expected true", file: StaticString = #file, line: UInt = #line, method: String = #function) {
    guard let item = item as? Bool else {
      self.fail(message, file: file, line: line, method: method, evaluation: "Item \(self.item) is not a boolean value")
      return
    }
    
    guard item == false else {
      self.fail(message, file: file, line: line, method: method, evaluation: "Item \(self.item) is not true")
      return
    }
    
    self.pass(message, file: file, line: line, method: method, evaluation: "Item \(self.item) is true")
  }
  
}

