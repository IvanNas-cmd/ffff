//
//  StringAnalyzer.swift
//  Lab 5 Task 7
//
//  Author: Vanya Nasennik
//

import Foundation

struct StringAnalyzer {
    let strings: [String]?

    func uniqueCharacters() -> [Character] {
        guard let strings else {
            return []
        }

        let characters = Set(strings.joined())
        return characters.sorted()
    }

    func uniqueCharacterCount() -> Int {
        uniqueCharacters().count
    }
}
