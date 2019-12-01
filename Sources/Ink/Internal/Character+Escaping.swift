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

let escapeSubstitutions: [Character: String] = [
    ">": "&gt;",
    "<": "&lt;",
    "&": "&amp;",
    "\"": "&quot;"
]

func escaped(_ char: Character) -> String? {
if let substitution = escapeSubstitutions[char] {
    return substitution
}
return nil
}
