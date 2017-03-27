//
//  Reporter.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2017-03-10.
//
//
import Focus
import Foundation

class Reporter: Reportable {
    
    var failureData:(used: Bool, comment: String, file: String, line: UInt, method: String) = (false, "", "", 0, "")
    var successData:(used: Bool, comment: String, file: String, line: UInt, method: String) = (false, "", "", 0, "")
    
    func testFailed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        self.failureData = (used: true, comment: message, file: String(describing: file), line: line, method: method)
    }
    
    func testPassed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        self.successData = (used: true, comment: message, file: String(describing: file), line: line, method: method)
    }
    
    func resetData() {
        failureData = (false, "", "", 0, "")
        successData = (false, "", "", 0, "")
    }
}
