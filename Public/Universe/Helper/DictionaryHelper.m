//
//  DictionaryHelper.m
//  Producer
//
//  Created by shuilin on 8/18/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import "DictionaryHelper.h"

@implementation DictionaryHelper

+ (void)dictionary:(NSMutableDictionary *)dict setObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if(anObject != nil && aKey != nil)
    {
        [dict setObject:anObject forKey:aKey];
    }
}
@end
