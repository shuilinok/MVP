//
//  CharHelper.m
//  MoneyCalculator
//
//  Created by shuilin on 4/6/17.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "CharHelper.h"

@implementation CharHelper

/* 判断字符是否是数字元素:0~9和. */
+ (BOOL)isNumberOrDot:(unichar)ch
{
    if(ch == '0' ||
       ch == '1' ||
       ch == '2' ||
       ch == '3' ||
       ch == '4' ||
       ch == '5' ||
       ch == '6' ||
       ch == '7' ||
       ch == '8' ||
       ch == '9' ||
       ch == '.')
    {
        return YES;
    }
    
    return NO;
}

@end
