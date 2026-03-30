//
//  FibonacciCalculator.m
//  Lab 5 Task 2
//
//  Author: Vanya Nasennik
//

#import "FibonacciCalculator.h"

@implementation FibonacciCalculator

- (NSArray<NSNumber *> *)firstFibonacciNumbers:(NSUInteger)count {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray array];

    if (count == 0) {
        return [numbers copy];
    }

    unsigned long long first = 1;
    unsigned long long second = 1;

    [numbers addObject:@(first)];
    if (count == 1) {
        return [numbers copy];
    }

    [numbers addObject:@(second)];
    for (NSUInteger index = 2; index < count; index++) {
        unsigned long long next = first + second;
        [numbers addObject:@(next)];
        first = second;
        second = next;
    }

    return [numbers copy];
}

- (unsigned long long)sumOfFirstFibonacciNumbers:(NSUInteger)count {
    unsigned long long sum = 0;
    for (NSNumber *number in [self firstFibonacciNumbers:count]) {
        sum += number.unsignedLongLongValue;
    }

    return sum;
}

@end
