//
//  ArrayRepository.swift
//  Lab 5 Task 7
//
//  Author: Vanya Nasennik
//

import Foundation

struct ArrayRepository {
    let immutableArray: [String] = ["alpha", "bravo", "charlie"]
    private(set) var mutableArray: [String] = []

    mutating func replaceMutableArray(with values: [String]) {
        mutableArray = values
    }

    mutating func append(_ value: String) {
        mutableArray.append(value)
    }

    mutating func insert(_ value: String, at index: Int) -> Bool {
        guard mutableArray.indices.contains(index) || index == mutableArray.count else {
            return false
        }

        mutableArray.insert(value, at: index)
        return true
    }

    @discardableResult
    mutating func removeLast() -> String? {
        guard !mutableArray.isEmpty else {
            return nil
        }

        return mutableArray.removeLast()
    }

    @discardableResult
    mutating func remove(at index: Int) -> String? {
        guard mutableArray.indices.contains(index) else {
            return nil
        }

        return mutableArray.remove(at: index)
    }

    mutating func clear() {
        mutableArray.removeAll()
    }

    var immutableCount: Int {
        immutableArray.count
    }

    var mutableCount: Int {
        mutableArray.count
    }
}
