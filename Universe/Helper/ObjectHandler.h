//
//  ObjectHandler.h
//  BDHI
//
//  Created by baidu on 14-9-4.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectHandler : NSObject

/*
 数组相减（数字）
 */
+ (NSArray*)objects:(NSArray*)objs minus:(NSArray*)another;

/*
 数组相减（字符串）
 */
+ (NSArray*)strings:(NSArray*)objs minus:(NSArray*)another;

/*
 找出批量对象指定key的值，组成数组
 */
+ (NSArray*)valuesOfObjects:(NSArray*)objects forKey:(NSString*)key;

/*
 字典相加
 */
+ (NSMutableDictionary*)addDictionary:(NSDictionary*)dict toAnother:(NSDictionary*)another;

/*
 用字典更新对象属性
 */
+ (void)updateObject:(id)object withProperties:(NSDictionary*)cProperties;

/*
 更新对象的指定名称的属性值
 */
+ (void)updateObject:(id)object withObject:(id)another keys:(NSArray*)keys;

/**
 把数组分组
 */
+ (NSMutableArray*)getPages:(NSArray*)allObjects size:(NSInteger)size;

/*
 根据类名创建对象,properties为属性
 */
+ (id)createObject:(NSString *)className properties:(NSDictionary*)properties;

@end
