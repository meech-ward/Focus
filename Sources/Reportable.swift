//
//  Reportable.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2017-03-01.
//
//

import Foundation

public protocol Reportable {
    
    func testFailed(file: StaticString, method: String, line: UInt, message: String, evaluation: String)
    
    func testPassed(file: StaticString, method: String, line: UInt, message: String, evaluation: String)
    
}

