//
//  Task7AppTests.swift
//  Lab 5 Task 7
//
//  Author: Vanya Nasennik
//

@testable import Task7App
import Testing

@Test
func uniqueCharactersAreCalculatedForOptionalArray() {
    let analyzer = StringAnalyzer(strings: ["swift", "strings"])

    #expect(analyzer.uniqueCharacterCount() == Set("swiftstrings").count)
}

@Test
func emptyOptionalArrayProducesZeroUniqueCharacters() {
    let analyzer = StringAnalyzer(strings: nil)

    #expect(analyzer.uniqueCharacterCount() == 0)
}

@Test
func repositoryInsertHonorsBounds() {
    var repository = ArrayRepository()
    repository.replaceMutableArray(with: ["one", "two"])
    let insertedAtStart = repository.insert("zero", at: 0)
    let insertedOutOfBounds = repository.insert("oops", at: 10)

    #expect(insertedAtStart)
    #expect(repository.mutableArray == ["zero", "one", "two"])
    #expect(insertedOutOfBounds == false)
}
