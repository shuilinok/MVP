//
//  IUserCourseListView.h
//  MVP-iPhone
//
//  Created by shuilin on 28/08/2017.
//  Copyright © 2017 xuetangx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IUserCourseListView <NSObject>

- (void)showListView;

- (void)showBlankView;

- (void)showErrorView;

@end
