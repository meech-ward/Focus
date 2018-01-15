//
//  Equalable.swift
//  FocusPackageDescription
//
//  Created by Sam Meech-Ward on 2018-01-14.
//

import Foundation

public extension Toable where ItemType: Equatable {
  
  /**
   Compare any two `Equatable` things
   `item1 == item2`
   
   - parameter item2: The second item to compare to the first item.
   - parameter message: The message to be output if the comparison fails.
   - parameter file: The file that this method was called from.
   - parameter line: The line number that this method was called from.
   */
  public func equal(_ item2: ItemType, _ message: String = "Expected true", file: StaticString = #file, line: UInt = #line, method: String = #function) {
    
    guard item == item2 else {
      self.fail(message, file: file, line: line, method: method, evaluation: "Item \(self.item) is not true")
      return
    }
    
    self.pass(message, file: file, line: line, method: method, evaluation: "Item \(self.item) is true")
  }
  
}
