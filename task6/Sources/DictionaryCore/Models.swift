//
//  Models.swift
//  Lab 5 Task 6
//
//  Author: Vanya Nasennik
//

import Foundation

public struct Soldier: Equatable, Sendable {
    public let name: String
    public let salary: Int

    public init(name: String, salary: Int) {
        self.name = name
        self.salary = salary
    }

    public var summary: String {
        "Soldier(name: \(name), salary: \(salary))"
    }
}

public struct Department: Equatable, Sendable {
    public let name: String
    public let position: String

    public init(name: String, position: String) {
        self.name = name
        self.position = position
    }

    public var summary: String {
        "Department(name: \(name), position: \(position))"
    }
}
