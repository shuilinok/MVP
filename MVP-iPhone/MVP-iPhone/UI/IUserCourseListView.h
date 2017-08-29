//
//  IUserCourseListView.h
//  MVP-iPhone
//
//  Created by shuilin on 28/08/2017.
//  Copyright © 2017 xuetangx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IUserCourseListView <NSObject>

@property (readonly, strong, nonatomic) UITableViewController *listController;

@property (readonly, strong, nonatomic) UIViewController *blankController;

@property (readonly, strong, nonatomic) UIViewController *errorController;

@end
