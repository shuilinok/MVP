//
//  ColorHelper.m
//  Idiom
//
//  Created by shuilin on 12/30/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import "ColorHelper.h"

@implementation ColorHelper

+ (UIColor *)colorWithRGB:(long)value
{
    UIColor *color = [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:1.0];
    
    return color;
}

+ (UIColor *)colorWithRGB:(long)value alpha:(CGFloat)alpha
{
    UIColor *color = [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:alpha];
    
    return color;
}
@end
