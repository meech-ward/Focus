//
//  FocusToBeTrue.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2016-12-12.
//
//

import Foundation

extension FocusTo where Item: ExpressibleByBooleanLiteral {
    
    func beTrue() {
        guard let item = item as? Bool else {
            Focus.failureHandler?("", "", 0)
            return
        }
        
        guard item == true else {
            Focus.failureHandler?("", "", 0)
            return
        }
        
        Focus.successHandler?("","",0)
    }
    
}
