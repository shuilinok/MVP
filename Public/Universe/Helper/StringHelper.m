//
//  StringHelper.m
//  Producer
//
//  Created by shuilin on 8/15/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import "StringHelper.h"

@implementation StringHelper

+ (NSString *)stringFromObject:(id)object
{
    if(object == nil)
    {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%@",object];
}

+ (NSString *)notNullString:(NSString *)str
{
    if(str == nil)
    {
        return @"";
    }
    
    return str;
}

//获取最后一个字符
+ (NSString *)lastKey:(NSString *)str
{
    if(str.length == 0)
    {
        return nil;
    }
    
    NSUInteger length = [str length];
    NSRange range = NSMakeRange(length - 1, 1);
    NSString *key = [str substringWithRange:range];
    
    return key;
}

//获取第一个字符
+ (NSString *)firstKey:(NSString *)str
{
    if(str.length == 0)
    {
        return nil;
    }
    
    NSRange range = NSMakeRange(0, 1);
    NSString *key = [str substringWithRange:range];
    
    return key;
}
@end
