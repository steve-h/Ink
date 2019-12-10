/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

internal protocol Readable {
    static func read(using reader: inout Reader) throws -> Self
}

extension Readable {
    static func readOrRewind(using reader: inout Reader) throws -> Self {
//        guard reader.previousCharacter != "\\" else {
//            throw Reader.Error()
//        }
// Not sure why this is here it is interfering with proper backslash handling
        let previousReaderIndex = reader.currentIndex

        do {
            return try read(using: &reader)
        } catch {
            reader.rewind(to: previousReaderIndex)
            throw error
        }
    }
}
