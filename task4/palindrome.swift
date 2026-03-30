//
//  palindrome.swift
//  Lab 5 Task 4
//
//  Author: Vanya Nasennik
//

import Foundation

func isFourDigitPalindrome(_ number: Int) -> Bool {
    guard number >= 1000 && number <= 9999 else {
        return false
    }

    let thousands = number / 1000
    let hundreds = (number / 100) % 10
    let tens = (number / 10) % 10
    let ones = number % 10

    return thousands == ones && hundreds == tens
}

print("Task 4. Check whether a four-digit number is a palindrome.")
print("Enter a natural four-digit number:")

if let line = readLine(), let number = Int(line) {
    if number >= 1000 && number <= 9999 {
        let result = isFourDigitPalindrome(number)
        print(result ? "\(number) is a palindrome." : "\(number) is not a palindrome.")
    } else {
        print("Error: please enter a natural four-digit number.")
    }
} else {
    print("Error: invalid input.")
}
