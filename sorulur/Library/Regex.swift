//
//  Regex.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation

/// Regex Pattern
let RegexEscapePattern = "[\\-\\[\\]\\/\\{\\}\\(\\)\\*\\+\\?\\.\\\\\\^\\$\\|]"
/// Regex Pattern For Regex
let RegexPatternRegex = Regex(RegexEscapePattern)

/// REGEX
open class Regex {
    
    /// Expression
    let expression: NSRegularExpression
    /// Pattern
    let pattern: String
    
    /// Regex İnit
    ///
    /// - Parameter pattern: String Regex Pattern
    ///    ### Usage Example: ###
    ///    ````
    ///    Regex(pattern)
    ///    ````
    public init(_ pattern: String) {
        self.pattern = pattern
        self.expression = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    /// String Match Regex
    ///
    /// - Parameter testStr: String value for matched regex
    /// - Returns: An occurrence of textual content found during the analysis of a block of text, such as when matching a regular expression.
    ///    ### Usage Example: ###
    ///    ````
    ///    Regex(pattern).mathes(String)
    ///    ````
    open func matches(_ testStr: String) -> [AnyObject] {
        let matches = self.expression.matches(in: testStr, options: [], range:NSMakeRange(0, testStr.count))
        return matches
    }
    
    /// Range of first match
    ///
    /// - Parameter testStr: String value for matched regex
    /// - Returns: A structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///    ### Usage Example: ###
    ///    ````
    ///    Regex(pattern).rangeOfFirstMatch(String)
    ///    ````
    open func rangeOfFirstMatch(_ testStr: String) -> NSRange {
        return self.expression.rangeOfFirstMatch(in: testStr, options: [], range:NSMakeRange(0, testStr.count))
    }
    
    /// Test Function
    ///
    /// - Parameter testStr: String value for matched regex
    /// - Returns: Boolean
    ///    ### Usage Example: ###
    ///    ````
    ///    let regex = Regex(Pattern)
    ///    if regex.test(testStr) {
    ///        .....
    ///    }
    ///    ````
    open func test(_ testStr: String) -> Bool {
        let matches = self.matches(testStr)
        return matches.count > 0
    }
    
    /// Escape String
    ///
    /// - Parameter str: String value for matched regex
    /// - Returns: String
    ///    ### Usage Example: ###
    ///    ````
    ///    let regex = Regex(pattern)
    ///    let text = regex.escapeStr(String)
    ///    ````
    open class func escapeStr(_ str: String) -> String {
        let matches = RegexPatternRegex.matches(str)
        var charArr:[Character] = Array(str)
        var strBuilder = [Character]()
        var i = 0
        for match in matches {
            if let range = match.range {
                while i < range.location + range.length {
                    if i == range.location {
                        strBuilder.append("\\")
                    }
                    strBuilder.append(charArr[i])
                    i += 1
                }
            }
        }
        while i < charArr.count {
            strBuilder.append(charArr[i])
            i += 1
        }
        return String(strBuilder)
    }
}

