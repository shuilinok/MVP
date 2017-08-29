//
//  UserCourseListViewPresenter.h
//  MVP-iPhone
//
//  Created by shuilin on 28/08/2017.
//  Copyright © 2017 xuetangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUserCourseListView.h"
#import "UserCourseList.h"

@interface UserCourseListViewPresenter : NSObject

- (instancetype)initWithView:(id<IUserCourseListView>)view;

@property (weak, nonatomic) UserCourseList *courseList;

- (void)loadList;

@end
