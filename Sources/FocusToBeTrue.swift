//
//  FocusToBeTrue.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

extension FocusTo where Item: ExpressibleByBooleanLiteral {
    
    func beTrue(_ message: String = "Item is not true", file: StaticString = #file, line: UInt = #line) {
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
