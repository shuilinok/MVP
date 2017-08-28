//
//  CharHelper.h
//  MoneyCalculator
//
//  Created by shuilin on 4/6/17.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CharHelper : NSObject

/* 判断字符是否是数字元素:0~9和. */
+ (BOOL)isNumberOrDot:(unichar)ch;

@end
