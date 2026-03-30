//
//  AppController.swift
//  Lab 5 Task 7
//
//  Author: Vanya Nasennik
//

import Foundation

struct AppController {
    private let view = ConsoleView()
    private var repository = ArrayRepository()

    mutating func run() {
        view.printMessage("Task 7. MVC console application for array processing.")

        var isRunning = true
        while isRunning {
            view.showMenu()

            switch readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
            case "1":
                showArrays()
            case "2":
                readMutableArray()
            case "3":
                showCounts()
            case "4":
                appendElement()
            case "5":
                insertElement()
            case "6":
                removeLastElement()
            case "7":
                removeElementByIndex()
            case "8":
                repository.clear()
                view.printMessage("Mutable array cleared.")
            case "9":
                analyzeUniqueCharacters()
            case "0":
                isRunning = false
            default:
                view.printMessage("Unknown command.")
            }
        }

        view.printMessage("Program finished.")
    }

    private func showArrays() {
        view.printArray("Immutable array", values: repository.immutableArray)
        view.printArray("Mutable array", values: repository.mutableArray)
    }

    private func showCounts() {
        view.printMessage("Immutable array count: \(repository.immutableCount)")
        view.printMessage("Mutable array count: \(repository.mutableCount)")
    }

    private mutating func readMutableArray() {
        guard let line = view.readValue(prompt: "Enter strings separated by spaces:") else {
            repository.replaceMutableArray(with: [])
            view.printMessage("Mutable array is empty.")
            return
        }

        let values = line
            .split(whereSeparator: \.isWhitespace)
            .map(String.init)
        repository.replaceMutableArray(with: values)
        view.printArray("Mutable array", values: repository.mutableArray)
    }

    private mutating func appendElement() {
        guard let value = view.readValue(prompt: "Enter element to append:") else {
            view.printMessage("Append cancelled.")
            return
        }

        repository.append(value)
        view.printArray("Mutable array", values: repository.mutableArray)
    }

    private mutating func insertElement() {
        guard
            let value = view.readValue(prompt: "Enter element to insert:"),
            let indexString = view.readValue(prompt: "Enter insertion index:"),
            let index = Int(indexString)
        else {
            view.printMessage("Insert cancelled.")
            return
        }

        if repository.insert(value, at: index) {
            view.printArray("Mutable array", values: repository.mutableArray)
        } else {
            view.printMessage("Index is out of bounds.")
        }
    }

    private mutating func removeLastElement() {
        if let removed = repository.removeLast() {
            view.printMessage("Removed last element: \(removed)")
            view.printArray("Mutable array", values: repository.mutableArray)
        } else {
            view.printMessage("Mutable array is already empty.")
        }
    }

    private mutating func removeElementByIndex() {
        guard
            let indexString = view.readValue(prompt: "Enter index to remove:"),
            let index = Int(indexString)
        else {
            view.printMessage("Removal cancelled.")
            return
        }

        if let removed = repository.remove(at: index) {
            view.printMessage("Removed element: \(removed)")
            view.printArray("Mutable array", values: repository.mutableArray)
        } else {
            view.printMessage("Index is out of bounds.")
        }
    }

    private func analyzeUniqueCharacters() {
        let optionalArray: [String]? = repository.mutableArray.isEmpty ? nil : repository.mutableArray
        let analyzer = StringAnalyzer(strings: optionalArray)
        let uniqueCharacters = analyzer.uniqueCharacters()

        view.printMessage("Unique characters count: \(analyzer.uniqueCharacterCount())")
        view.printMessage("Unique characters: \(String(uniqueCharacters))")
    }
}
