//
//  ColorHelper.h
//  Idiom
//
//  Created by shuilin on 12/30/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorHelper : NSObject

+ (UIColor *)colorWithRGB:(long)value;

+ (UIColor *)colorWithRGB:(long)value alpha:(CGFloat)alpha;
@end
