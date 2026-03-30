//
//  main.m
//  Lab 5 Task 3
//
//  Author: Vanya Nasennik
//

#import <Foundation/Foundation.h>
#import "ArrayManager.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"Task 3. Objective-C arrays demonstration.");

        ArrayManager *manager = [[ArrayManager alloc] init];
        [manager runDemo];
    }

    return 0;
}
