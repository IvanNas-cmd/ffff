//
//  FibonacciCalculator.h
//  Lab 5 Task 2
//
//  Author: Vanya Nasennik
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FibonacciCalculator : NSObject

- (NSArray<NSNumber *> *)firstFibonacciNumbers:(NSUInteger)count;
- (unsigned long long)sumOfFirstFibonacciNumbers:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
