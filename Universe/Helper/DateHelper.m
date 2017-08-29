//
//  DateHelper.m
//  Producer
//
//  Created by shuilin on 8/15/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

+(NSDate *)stringToDate:(NSString *)dateString
{
    if(!dateString||[dateString isKindOfClass:[NSNull class]]){
        return [NSDate dateWithTimeIntervalSince1970:0];
    }
    NSString *formatter = @"yyyy-MM-dd HH:mm:ss";
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:formatter];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    return [dateFormatter dateFromString:dateString];
}

+ (NSString *)dateString:(NSDate *)date isHasSeconds:(BOOL)isHasSeconds
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    if (isHasSeconds)
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    else
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

@end
