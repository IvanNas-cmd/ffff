//
//  ArrayManager.h
//  Lab 5 Task 3
//
//  Author: Vanya Nasennik
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArrayManager : NSObject

- (void)runDemo;
- (NSNumber * _Nullable)maxNumberInImmutableArray:(NSArray<NSNumber *> *)numbers;

@end

NS_ASSUME_NONNULL_END
