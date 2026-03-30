//
//  ArrayManager.m
//  Lab 5 Task 3
//
//  Author: Vanya Nasennik
//

#import "ArrayManager.h"

@interface ArrayManager ()

- (NSMutableArray<NSNumber *> *)readMutableArrayFromConsole;
- (NSNumber * _Nullable)readNumberWithPrompt:(NSString *)prompt;
- (NSUInteger)readIndexWithPrompt:(NSString *)prompt;
- (void)printArray:(NSArray<NSNumber *> *)array title:(NSString *)title;

@end

@implementation ArrayManager

- (void)runDemo {
    NSArray<NSNumber *> *immutableNumbers = @[@15, @25, @5, @10, @20];
    [self printArray:immutableNumbers title:@"Immutable array"];

    NSNumber *maxNumber = [self maxNumberInImmutableArray:immutableNumbers];
    if (maxNumber != nil) {
        NSLog(@"Maximum number in immutable array: %@", maxNumber);
    }
    NSLog(@"Immutable array count: %lu", (unsigned long)immutableNumbers.count);

    NSMutableArray<NSNumber *> *mutableNumbers = [NSMutableArray array];
    NSLog(@"Created empty mutable array.");
    NSLog(@"Mutable array count: %lu", (unsigned long)mutableNumbers.count);

    mutableNumbers = [self readMutableArrayFromConsole];
    [self printArray:mutableNumbers title:@"Mutable array after console input"];
    NSLog(@"Mutable array count: %lu", (unsigned long)mutableNumbers.count);

    NSNumber *numberToAdd = [self readNumberWithPrompt:@"Enter a number to append:"];
    if (numberToAdd != nil) {
        [mutableNumbers addObject:numberToAdd];
        [self printArray:mutableNumbers title:@"Mutable array after append"];
    }

    NSNumber *numberToInsert = [self readNumberWithPrompt:@"Enter a number to insert:"];
    NSUInteger insertionIndex = [self readIndexWithPrompt:@"Enter insertion index:"];
    if (numberToInsert != nil && insertionIndex <= mutableNumbers.count) {
        [mutableNumbers insertObject:numberToInsert atIndex:insertionIndex];
        [self printArray:mutableNumbers title:@"Mutable array after insert"];
    } else {
        NSLog(@"Insert skipped because the index is out of bounds.");
    }

    if (mutableNumbers.count > 0) {
        [mutableNumbers removeLastObject];
        [self printArray:mutableNumbers title:@"Mutable array after removing last element"];
    }

    if (mutableNumbers.count > 0) {
        NSUInteger removalIndex = [self readIndexWithPrompt:@"Enter index to remove:"];
        if (removalIndex < mutableNumbers.count) {
            [mutableNumbers removeObjectAtIndex:removalIndex];
            [self printArray:mutableNumbers title:@"Mutable array after removing by index"];
        } else {
            NSLog(@"Removal by index skipped because the index is out of bounds.");
        }
    }

    [mutableNumbers removeAllObjects];
    [self printArray:mutableNumbers title:@"Mutable array after removing all elements"];
}

- (NSNumber * _Nullable)maxNumberInImmutableArray:(NSArray<NSNumber *> *)numbers {
    if (numbers.count == 0) {
        return nil;
    }

    NSNumber *maxNumber = numbers.firstObject;
    for (NSNumber *number in numbers) {
        if (number.integerValue > maxNumber.integerValue) {
            maxNumber = number;
        }
    }

    return maxNumber;
}

- (NSMutableArray<NSNumber *> *)readMutableArrayFromConsole {
    NSLog(@"Enter integer elements separated by spaces:");

    char buffer[1024];
    if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
        return [NSMutableArray array];
    }

    NSString *line = [[NSString stringWithUTF8String:buffer]
        stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (line.length == 0) {
        return [NSMutableArray array];
    }

    NSMutableArray<NSNumber *> *numbers = [NSMutableArray array];
    NSArray<NSString *> *parts = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    for (NSString *part in parts) {
        if (part.length == 0) {
            continue;
        }

        NSInteger value = part.integerValue;
        [numbers addObject:@(value)];
    }

    return numbers;
}

- (NSNumber * _Nullable)readNumberWithPrompt:(NSString *)prompt {
    NSLog(@"%@", prompt);

    char buffer[256];
    if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
        return nil;
    }

    NSString *line = [[NSString stringWithUTF8String:buffer]
        stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (line.length == 0) {
        return nil;
    }

    return @([line integerValue]);
}

- (NSUInteger)readIndexWithPrompt:(NSString *)prompt {
    NSLog(@"%@", prompt);

    char buffer[256];
    if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
        return NSNotFound;
    }

    NSString *line = [[NSString stringWithUTF8String:buffer]
        stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (line.length == 0) {
        return NSNotFound;
    }

    NSInteger value = [line integerValue];
    return value < 0 ? NSNotFound : (NSUInteger)value;
}

- (void)printArray:(NSArray<NSNumber *> *)array title:(NSString *)title {
    NSMutableArray<NSString *> *items = [NSMutableArray array];
    for (NSNumber *number in array) {
        [items addObject:number.stringValue];
    }

    NSLog(@"%@: [%@]", title, [items componentsJoinedByString:@", "]);
}

@end
