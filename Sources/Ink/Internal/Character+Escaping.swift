/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

internal extension Character {
    var escaped: String? {
        switch self {
        case ">": return "&gt;"
        case "<": return "&lt;"
        case "&": return "&amp;"
        case "\"": return "&quot;"
        default: return nil
        }
    }
}
// ASCII chars escapable
// \!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~
// Result desired
// !&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~
let escapeSubstitutions: [Character: String] = [
    "!": "!",
    "#": "#",
    "$": "$",
    "%": "%",
    "(": "(",
    ")": ")",
    "\'": "\'",
    "*": "*",
    "+": "+",
    ",": ",",
    "-": "-",
    ".": ".",
    "/": "/",
    "\\": "\\",
    ":": ":",
    ";": ";",
    "=": "=",
    "?": "?",
    "@": "@",
    "[": "[",
    "]": "]",
    "^": "^",
    "_": "_",
    "`": "`",
    "{": "{",
    "}": "}",
    "|": "|",
    "~": "~",
    ">": "&gt;",
    "<": "&lt;",
    "&": "&amp;",
    "\"": "&quot;",
    
]

func escaped(_ char: Character) -> String? {
if let substitution = escapeSubstitutions[char] {
    return substitution
}
return nil
}
