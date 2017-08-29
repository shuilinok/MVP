//
//  ObjectHandler.m
//  BDHI
//
//  Created by baidu on 14-9-4.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "ObjectHandler.h"

@implementation ObjectHandler

/*
 数组相减（字符串，数字）
 */
+ (NSArray*)objects:(NSArray*)objs minus:(NSArray*)another
{
    if(objs == nil)
    {
        return nil;
    }
    
    if(another == nil)
    {
        return objs;
    }
    
    NSMutableSet* anotherSet = [[NSMutableSet alloc] init];
    for(id o in another)
    {
        NSNumber *number = [NSNumber numberWithLongLong:[o longLongValue]];
        [anotherSet addObject:number];
    }
    
    NSMutableSet* mySet = [[NSMutableSet alloc] init];
    for(id o in objs)
    {
        NSNumber *number = [NSNumber numberWithLongLong:[o longLongValue]];
        [mySet addObject:number];
    }
    
    [mySet minusSet:anotherSet];
    
    
    NSMutableArray* more = [[NSMutableArray alloc] init];
    
    for(id o in mySet)
    {
        [more addObject:o];
    }
    
    return more;
}

/*
 数组相减（字符串）
 */
+ (NSArray*)strings:(NSArray*)objs minus:(NSArray*)another
{
    if(objs == nil)
    {
        return nil;
    }
    
    if(another == nil)
    {
        return objs;
    }
    
    NSMutableSet* anotherSet = [[NSMutableSet alloc] init];
    for(NSString *o in another)
    {
//        NSString *caseString = [o lowercaseString];
//        if(caseString)
//        {
//            [anotherSet addObject:caseString];
//        }
        [anotherSet addObject:o];
    }
    
    NSMutableSet* mySet = [[NSMutableSet alloc] init];
    for(NSString *o in objs)
    {
//        NSString *caseString = [o lowercaseString];
//        if(caseString)
//        {
//            [mySet addObject:caseString];
//        }
        [mySet addObject:o];
    }
    
    [mySet minusSet:anotherSet];
    
    
    NSMutableArray* more = [[NSMutableArray alloc] init];
    
    for(id o in mySet)
    {
        [more addObject:o];
    }
    
    return more;
}

/*
 找出批量对象指定key的值，组成数组
 */
+ (NSArray*)valuesOfObjects:(NSArray*)objects forKey:(NSString*)key
{
    NSMutableArray* values = [[NSMutableArray alloc] init];
    for(id o in objects)
    {
        if([o respondsToSelector:NSSelectorFromString(key)])
        {
            id value = [o valueForKey:key];
            if(value != nil)
            {
                [values addObject:value];
            }
        }
    }
    
    return values;
}

/*
 字典相加
 */
+ (NSMutableDictionary*)addDictionary:(NSDictionary*)dict toAnother:(NSDictionary*)another
{
    NSMutableDictionary* result = nil;
    
    if(dict == nil)
    {
        result = (another == nil) ? nil : [NSMutableDictionary dictionaryWithDictionary:another];
        return result;
    }
    
    if(another == nil)
    {
        result = [[NSMutableDictionary alloc] init];
    }
    else
    {
        result = [NSMutableDictionary dictionaryWithDictionary:another];
    }
    
    NSArray* keys = [dict allKeys];
    for(id key in keys)
    {
        id object = [dict objectForKey:key];
        
        [result setObject:object forKey:key];
    }
    
    return result;
}

/*
 用字典更新对象属性
 */
+ (void)updateObject:(id)object withProperties:(NSDictionary*)cProperties
{
    
        NSArray* keys = cProperties.allKeys;
        for(id key in keys)
        {
            @try {
                id value = [cProperties objectForKey:key];
                if([object respondsToSelector:NSSelectorFromString(key)])
                {
                    [object setValue:value forKey:key];
                }
            }
            @catch (NSException *exception) {
                NSLog(@"warning : exception from updateObject:withProperties: %@",[exception description]);
            }
            @finally {
                
            }
        }
    
    
}

/*
 更新对象的指定名称的属性值
 */
+ (void)updateObject:(id)object withObject:(id)another keys:(NSArray*)keys
{
    
        for(id key in keys)
        {
            @try {
                if([another respondsToSelector:NSSelectorFromString(key)])
                {
                    id value = [another valueForKey:key];
                    if(value && [object respondsToSelector:NSSelectorFromString(key)])
                    {
                        [object setValue:value forKey:key];
                    }
                }
            }
            @catch (NSException *exception) {
                NSLog(@"warning : exception from updateObject:withObject:keys:");
            }
            @finally {
                
            }
        }
    
    
}

/**
 把数组分组
 */
+ (NSMutableArray*)getPages:(NSArray*)allObjects size:(NSInteger)size
{
    NSMutableArray* pages = [[NSMutableArray alloc] init];
    NSMutableArray* subObjects = nil;
    
    NSUInteger count = [allObjects count];
    for(NSUInteger i = 0; i < count; i++)
    {
        if(i % size == 0)
        {
            subObjects = [[NSMutableArray alloc] init];
            [pages insertObject:subObjects atIndex:0];
        }
        
        id obj = [allObjects objectAtIndex:i];
        [subObjects addObject:obj];
    }
    
    return pages;
}

/*
 根据类名创建对象,properties为属性
 */
+ (id)createObject:(NSString *)className properties:(NSDictionary*)properties
{
    Class cla = NSClassFromString(className);
    id object = [[cla alloc] init];
    
    [ObjectHandler updateObject:object withProperties:properties];
    
    return object;
}
@end
