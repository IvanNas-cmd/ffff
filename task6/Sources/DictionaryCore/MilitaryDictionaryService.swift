//
//  MilitaryDictionaryService.swift
//  Lab 5 Task 6
//
//  Author: Vanya Nasennik
//

import Foundation

public final class MilitaryDictionaryService {
    public private(set) var soldiers: [String: Soldier]
    public private(set) var departments: [String: Department]

    public init() {
        soldiers = [:]
        departments = [
            "D-101": Department(name: "Alpha", position: "Commander"),
            "D-205": Department(name: "Bravo", position: "Signal Officer"),
            "D-310": Department(name: "Charlie", position: "Medic")
        ]
    }

    public func soldierCount() -> Int {
        soldiers.count
    }

    public func departmentCount() -> Int {
        departments.count
    }

    public func soldier(forKey key: String) -> Soldier? {
        soldiers[key]
    }

    public func department(forKey key: String) -> Department? {
        departments[key]
    }

    public func allSoldiers() -> [(String, Soldier)] {
        soldiers.map { ($0.key, $0.value) }
    }

    public func allDepartments() -> [(String, Department)] {
        departments.map { ($0.key, $0.value) }
    }

    public func addSoldier(key: String, name: String, salary: Int) {
        soldiers[key] = Soldier(name: name, salary: salary)
    }

    public func updateSoldier(key: String, name: String, salary: Int) {
        soldiers[key] = Soldier(name: name, salary: salary)
    }

    public func addDepartment(key: String, name: String, position: String) {
        departments[key] = Department(name: name, position: position)
    }

    public func updateDepartment(key: String, name: String, position: String) {
        departments[key] = Department(name: name, position: position)
    }

    @discardableResult
    public func removeSoldier(key: String) -> Soldier? {
        soldiers.removeValue(forKey: key)
    }

    @discardableResult
    public func removeDepartment(key: String) -> Department? {
        departments.removeValue(forKey: key)
    }

    public func clearSoldiers() {
        soldiers.removeAll()
    }

    public func clearDepartments() {
        departments.removeAll()
    }

    public func sortedSoldiersByKey() -> [(String, Soldier)] {
        soldiers.sorted { left, right in
            left.key.localizedCaseInsensitiveCompare(right.key) == .orderedAscending
        }
    }

    public func sortedSoldiersByValue() -> [(String, Soldier)] {
        soldiers.sorted { left, right in
            if left.value.salary == right.value.salary {
                return left.value.name.localizedCaseInsensitiveCompare(right.value.name) == .orderedAscending
            }
            return left.value.salary < right.value.salary
        }
    }

    public func sortedDepartmentsByKey() -> [(String, Department)] {
        departments.sorted { left, right in
            left.key.localizedCaseInsensitiveCompare(right.key) == .orderedAscending
        }
    }

    public func sortedDepartmentsByValue() -> [(String, Department)] {
        departments.sorted { left, right in
            let positionOrder = left.value.position.localizedCaseInsensitiveCompare(right.value.position)
            if positionOrder == .orderedSame {
                return left.value.name.localizedCaseInsensitiveCompare(right.value.name) == .orderedAscending
            }
            return positionOrder == .orderedAscending
        }
    }
}
