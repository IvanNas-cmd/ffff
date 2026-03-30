//
//  ConsoleView.swift
//  Lab 5 Task 7
//
//  Author: Vanya Nasennik
//

import Foundation

struct ConsoleView {
    func showMenu() {
        print(
            """

            Choose an operation:
            1 - Show arrays
            2 - Input mutable array from console
            3 - Show counts
            4 - Append element
            5 - Insert element by index
            6 - Remove last element
            7 - Remove element by index
            8 - Clear mutable array
            9 - Count unique characters
            0 - Exit
            """
        )
    }

    func printMessage(_ message: String) {
        print(message)
    }

    func printArray(_ title: String, values: [String]) {
        print("\(title): [\(values.joined(separator: ", "))]")
    }

    func readValue(prompt: String) -> String? {
        print(prompt, terminator: " ")
        guard let line = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !line.isEmpty else {
            return nil
        }
        return line
    }
}
