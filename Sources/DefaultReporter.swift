//
//  DefaultReporter.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2017-03-20.
//
//

import Foundation

enum ANSI {
    case escapeCode
    
    func escape() -> String {
        return ANSI.escapeCode.caseString()+self.caseString()
    }
    
    func console() {
        let string = self.escape()
        print(string, terminator: "")
    }
    
    case clearLine
    case clearScreen
    case moveCursorBack(times: Int)
    case moveCursorUp(times: Int)
    
    // MARK: Colors
    case green
    case white
    case red
    
    private func caseString() -> String {
        switch self {
        case .escapeCode: return "\u{001B}["
        case .clearLine: return "0J"
        case .clearScreen: return "2J"
        case let .moveCursorBack(times): return "\(times)D"
        case let .moveCursorUp(times): return "\(times)A"
        case .green: return "32m"
        case .white: return "37m"
        case .red: return "31m"
        }
    }
}

public class DefaultReporter: Reportable {
    
    private init() {
    }
    
    public static let sharedReporter = DefaultReporter()
    
    public var totalTestsPassed = 0
    public var totalTestsFailed = 0
    
    public func testPassed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        totalTestsFailed+=1
        var printMessage = "  "
        
        printMessage += "👍"
        
        printPass(printMessage)
    }
    
    public func testFailed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        totalTestsPassed+=1
        var printMessage = "  "
        
        printMessage += "👎  \(message), \(evaluation). File: \(file), Method: \(method), Line:\(line)"
        
        printFail(printMessage)
    }
}


// MARK: Print
public extension DefaultReporter {

    func printTest(_ text: String) {
        ANSI.white.console()
        print(text)
    }
    
    func printPass(_ text: String) {
        ANSI.green.console()
        print(text)
        ANSI.white.console()
    }
    
    func printFail(_ text: String) {
        ANSI.red.console()
        print(text)
        ANSI.white.console()
    }
    
    func printWithIndentation(file: StaticString, method: String, line: UInt, message: String, blockType: String, indentationLevel: Int) {
        if indentationLevel == 0 {
            print("")
            printTest("\nFile: \(file), Method: \(method)")
        }
        
        var printMessage = ""
        
        for _ in 0...indentationLevel {
            printMessage += "--"
        }
        
        printMessage += "| \(blockType)): "
        
        printMessage += message
        
        printTest(printMessage)
    }

}
