//
//  main.m
//  Lab 5 Task 2
//
//  Author: Vanya Nasennik
//

#import <Foundation/Foundation.h>
#import "FibonacciCalculator.h"

static NSUInteger readPositiveInteger(void) {
    char buffer[256];
    if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
        return 0;
    }

    NSString *input = [[NSString stringWithUTF8String:buffer]
        stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSScanner *scanner = [NSScanner scannerWithString:input];
    NSInteger value = 0;

    if (![scanner scanInteger:&value] || !scanner.isAtEnd || value < 0) {
        return 0;
    }

    return (NSUInteger)value;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"Task 2. Sum of the first k Fibonacci numbers.");
        NSLog(@"Enter k:");

        NSUInteger count = readPositiveInteger();
        FibonacciCalculator *calculator = [[FibonacciCalculator alloc] init];
        NSArray<NSNumber *> *numbers = [calculator firstFibonacciNumbers:count];
        unsigned long long sum = [calculator sumOfFirstFibonacciNumbers:count];

        if (count == 0) {
            NSLog(@"No numbers were generated. Please enter a non-negative integer greater than zero.");
            return 0;
        }

        NSMutableArray<NSString *> *parts = [NSMutableArray array];
        for (NSNumber *number in numbers) {
            [parts addObject:number.stringValue];
        }

        NSLog(@"First %lu Fibonacci numbers: %@", (unsigned long)count, [parts componentsJoinedByString:@" "]);
        NSLog(@"Sum: %llu", sum);
    }

    return 0;
}
