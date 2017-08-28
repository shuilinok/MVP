//
//  ViewHelper.m
//  Producer
//
//  Created by shuilin on 8/12/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import "ViewHelper.h"
#import "MBProgressHUD.h"

@implementation ViewHelper

+ (UIView *)showActivictorOnView:(UIView *)view
{
    return [MBProgressHUD showHUDAddedTo:view animated:YES];
}

+ (void)hideActivictorOnView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:NO];
}

+ (void)showTextHud:(NSString *)text onView:(UIView *)view time:(float)time
{
    if(view == nil)
    {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD* showHud = (MBProgressHUD*)[[UIApplication sharedApplication].keyWindow.rootViewController.view viewWithTag:788];
    if (showHud) {
        [showHud removeFromSuperview];
        showHud = nil;
    }
    showHud = [[MBProgressHUD alloc] init];
    showHud.frame = CGRectMake(view.frame.size.width/2-50/2, view.frame.size.height/2-50/2, 50, 50);
    showHud.dimBackground = YES;
    showHud.tag = 788;
    showHud.color = [UIColor blackColor];
    [view addSubview:showHud];
    showHud.mode = MBProgressHUDModeText;
    showHud.margin = 12;
    showHud.yOffset = -50;
    if (text != nil || text.length != 0) {
        showHud.detailsLabelText = text;
        showHud.labelText = nil;
    }
    [showHud show:YES];
    [showHud hide:YES afterDelay:time];
}

@end
