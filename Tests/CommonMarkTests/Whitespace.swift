//
//  Whitespace.swift
//  
//
//  Created by Stephen Hume on 2019-12-03.
//

import Foundation


extension String {
func normalizeWhitespace (_ inHTML: String) -> String {
    
    return inHTML.replacingOccurrences(of: ">\n<", with: "><")
}
}
