//
//  Contents.swift
//  Lab 5 Task 4 Playground
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

let sampleValues = [1221, 1234, 4554, 999, 7007]

for value in sampleValues {
    let message = isFourDigitPalindrome(value)
        ? "\(value) is a palindrome."
        : "\(value) is not a palindrome."
    print(message)
}
