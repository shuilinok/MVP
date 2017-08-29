//
//  ArrayHelper.m
//  Idiom
//
//  Created by shuilin on 1/16/17.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "ArrayHelper.h"

@implementation ArrayHelper

+ (NSArray *)randomizedArray:(NSArray *)array
{
    if(array == nil)
    {
        return nil;
    }
    
    NSMutableArray *results = [NSMutableArray arrayWithArray:array];
    
    NSInteger i = [results count];
    while(--i > 0)
    {
        NSInteger j = arc4random() % (i+1);
        [results exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    return [NSArray arrayWithArray:results];
}
@end
