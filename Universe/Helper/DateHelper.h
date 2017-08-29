//
//  DateHelper.h
//  Producer
//
//  Created by shuilin on 8/15/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

+ (NSString *)dateString:(NSDate *)date isHasSeconds:(BOOL)isHasSeconds;

+ (NSDate *)stringToDate:(NSString *)dateString;

@end
