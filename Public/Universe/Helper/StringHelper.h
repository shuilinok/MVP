//
//  StringHelper.h
//  Producer
//
//  Created by shuilin on 8/15/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringHelper : NSObject

+ (NSString *)stringFromObject:(id)object;

+ (NSString *)notNullString:(NSString *)str;

//获取最后一个字符
+ (NSString *)lastKey:(NSString *)str;

//获取第一个字符
+ (NSString *)firstKey:(NSString *)str;

@end
