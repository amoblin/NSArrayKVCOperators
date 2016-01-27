//
//  NSArray+CustomKVOOperators.m
//  Demo
//
//  Created by amoblin on 16/1/27.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "NSArray+CustomKVOOperators.h"
#import <objc/runtime.h>

@implementation NSArray (CustomKVOOperators)


- (id)objectForKeyPath:(NSString *)keyPath atIndex:(NSInteger)index;
{
    NSArray* array = [self valueForKeyPath: keyPath];
    if( [array respondsToSelector: @selector(objectAtIndex:)] &&
       [array respondsToSelector: @selector(count)]) {
        if( [array count] && index < [array count]) {
            return [array objectAtIndex:index];
        } else {
            return nil;
        }
    }
    else {
        return nil;
    }
}

+ (BOOL)resolveInstanceMethod:(SEL)sel;
{
    NSString *suffixStr = @"ForKeyPath:";

    NSString *selStr = NSStringFromSelector(sel);
    
    if ( ![selStr hasSuffix:suffixStr]) {
        return [super resolveInstanceMethod:sel];
    }
    
    class_addMethod([self class], sel, (IMP) dynamicMethodIMP, "@@:");
    return YES;
}

static id dynamicMethodIMP(id self, SEL sel, NSString *aString)
{
    NSString *suffixStr = @"ForKeyPath:";
    NSString *selStr = NSStringFromSelector(sel);
    NSString *index = [selStr substringToIndex:selStr.length - suffixStr.length];
    NSInteger i = 0;
    if ([index isEqualToString:@"first"]) {
        i = 0;
    } else if ([index isEqualToString:@"last"]) {
        NSArray* array = [self valueForKeyPath: aString];
        if( [array respondsToSelector: @selector(objectAtIndex:)] &&
           [array respondsToSelector: @selector(count)]) {
            i = [array count] - 1;
        }
    }
    return [self objectForKeyPath:aString atIndex:i];
}

@end
