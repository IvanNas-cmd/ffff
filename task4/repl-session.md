# Swift REPL Session

Example session for task 4:

```swift
$ swift
Welcome to Swift
  1> func isFourDigitPalindrome(_ number: Int) -> Bool {
  2.     guard number >= 1000 && number <= 9999 else { return false }
  3.     let thousands = number / 1000
  4.     let hundreds = (number / 100) % 10
  5.     let tens = (number / 10) % 10
  6.     let ones = number % 10
  7.     return thousands == ones && hundreds == tens
  8. }
  9> isFourDigitPalindrome(1221)
$R0: Bool = true
 10> isFourDigitPalindrome(1234)
$R1: Bool = false
```
