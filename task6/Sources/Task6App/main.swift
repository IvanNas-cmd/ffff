//
//  main.swift
//  Lab 5 Task 6
//
//  Author: Vanya Nasennik
//

import DictionaryCore
import Foundation

final class Task6ConsoleApp {
    private let service = MilitaryDictionaryService()

    func run() {
        print("Task 6. Dictionary processing console application.")

        var isRunning = true
        while isRunning {
            printMenu()

            switch readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
            case "1":
                printSoldiers(service.allSoldiers(), title: "All soldiers")
            case "2":
                addSoldier()
            case "3":
                updateSoldier()
            case "4":
                findSoldier()
            case "5":
                print("Soldier dictionary count: \(service.soldierCount())")
            case "6":
                printSoldiers(service.sortedSoldiersByKey(), title: "Soldiers sorted by key")
            case "7":
                printSoldiers(service.sortedSoldiersByValue(), title: "Soldiers sorted by salary")
            case "8":
                removeSoldier()
            case "9":
                service.clearSoldiers()
                print("All soldiers removed.")
            case "10":
                printDepartments(service.allDepartments(), title: "All departments")
            case "11":
                addDepartment()
            case "12":
                updateDepartment()
            case "13":
                findDepartment()
            case "14":
                print("Department dictionary count: \(service.departmentCount())")
            case "15":
                printDepartments(service.sortedDepartmentsByKey(), title: "Departments sorted by key")
            case "16":
                printDepartments(service.sortedDepartmentsByValue(), title: "Departments sorted by value")
            case "17":
                removeDepartment()
            case "18":
                service.clearDepartments()
                print("All departments removed.")
            case "0":
                isRunning = false
            default:
                print("Unknown command.")
            }
        }

        print("Program finished.")
    }

    private func printMenu() {
        print(
            """

            Choose an operation:
            1  - Show all soldiers
            2  - Add soldier
            3  - Update soldier
            4  - Find soldier by key
            5  - Count soldiers
            6  - Sort soldiers by key
            7  - Sort soldiers by salary
            8  - Remove soldier by key
            9  - Clear soldier dictionary
            10 - Show all departments
            11 - Add department
            12 - Update department
            13 - Find department by key
            14 - Count departments
            15 - Sort departments by key
            16 - Sort departments by value
            17 - Remove department by key
            18 - Clear department dictionary
            0  - Exit
            """
        )
    }

    private func addSoldier() {
        guard
            let key = prompt("Enter soldier key:"),
            let name = prompt("Enter soldier name:"),
            let salaryString = prompt("Enter soldier salary:"),
            let salary = Int(salaryString)
        else {
            print("Invalid soldier input.")
            return
        }

        service.addSoldier(key: key, name: name, salary: salary)
        print("Soldier added.")
    }

    private func updateSoldier() {
        guard
            let key = prompt("Enter soldier key to update:"),
            let name = prompt("Enter new soldier name:"),
            let salaryString = prompt("Enter new soldier salary:"),
            let salary = Int(salaryString)
        else {
            print("Invalid soldier input.")
            return
        }

        service.updateSoldier(key: key, name: name, salary: salary)
        print("Soldier updated.")
    }

    private func findSoldier() {
        guard let key = prompt("Enter soldier key:") else {
            print("Invalid key.")
            return
        }

        if let soldier = service.soldier(forKey: key) {
            print("\(key): \(soldier.summary)")
        } else {
            print("Soldier not found.")
        }
    }

    private func removeSoldier() {
        guard let key = prompt("Enter soldier key to remove:") else {
            print("Invalid key.")
            return
        }

        if service.removeSoldier(key: key) != nil {
            print("Soldier removed.")
        } else {
            print("Soldier not found.")
        }
    }

    private func addDepartment() {
        guard
            let key = prompt("Enter department key:"),
            let name = prompt("Enter department name:"),
            let position = prompt("Enter department position:")
        else {
            print("Invalid department input.")
            return
        }

        service.addDepartment(key: key, name: name, position: position)
        print("Department added.")
    }

    private func updateDepartment() {
        guard
            let key = prompt("Enter department key to update:"),
            let name = prompt("Enter new department name:"),
            let position = prompt("Enter new department position:")
        else {
            print("Invalid department input.")
            return
        }

        service.updateDepartment(key: key, name: name, position: position)
        print("Department updated.")
    }

    private func findDepartment() {
        guard let key = prompt("Enter department key:") else {
            print("Invalid key.")
            return
        }

        if let department = service.department(forKey: key) {
            print("\(key): \(department.summary)")
        } else {
            print("Department not found.")
        }
    }

    private func removeDepartment() {
        guard let key = prompt("Enter department key to remove:") else {
            print("Invalid key.")
            return
        }

        if service.removeDepartment(key: key) != nil {
            print("Department removed.")
        } else {
            print("Department not found.")
        }
    }

    private func printSoldiers(_ entries: [(String, Soldier)], title: String) {
        print(title + ":")
        if entries.isEmpty {
            print("  <empty>")
            return
        }

        for (key, soldier) in entries {
            print("  \(key): \(soldier.summary)")
        }
    }

    private func printDepartments(_ entries: [(String, Department)], title: String) {
        print(title + ":")
        if entries.isEmpty {
            print("  <empty>")
            return
        }

        for (key, department) in entries {
            print("  \(key): \(department.summary)")
        }
    }

    private func prompt(_ message: String) -> String? {
        print(message, terminator: " ")
        guard let line = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !line.isEmpty else {
            return nil
        }
        return line
    }
}

Task6ConsoleApp().run()
