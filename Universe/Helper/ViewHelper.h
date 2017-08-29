//
//  ViewHelper.h
//  Producer
//
//  Created by shuilin on 8/12/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewHelper : NSObject

+ (UIView *)showActivictorOnView:(UIView *)view;

+ (void)hideActivictorOnView:(UIView *)view;

+ (void)showTextHud:(NSString *)text onView:(UIView *)view time:(float)time;

@end
