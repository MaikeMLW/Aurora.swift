//
//  File.swift
//  
//
//  Created by Wesley de Groot on 01/04/2020.
//

import Foundation

/**
 * Log
 *
 * This is used to send log messages with the following syntax
 *
 *     [Aurora] Filename:line functionName(...):
 *      Message
 *
 * - parameter message: the message to send
 * - parameter file: the filename
 * - parameter line: the line
 * - parameter function: function name
 */
@discardableResult
public func log(_ message: Any, file: String = #file, line: Int = #line, function: String = #function) -> Bool {
    if (debug) {
        let fileName: String = String(
            (file.split(separator: "/").last)!.split(separator: ".").first!
        )
        
        Swift.print("[Aurora] \(fileName):\(line) \(function):\n \(message)\n")
    }
    
    return true
}
