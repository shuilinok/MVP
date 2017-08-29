//
//  UserCourseListViewPresenter.m
//  MVP-iPhone
//
//  Created by shuilin on 28/08/2017.
//  Copyright © 2017 xuetangx. All rights reserved.
//

#import "UserCourseListViewPresenter.h"

@interface UserCourseListViewPresenter ()

@property (weak, nonatomic) id<IUserCourseListView> view;

@end

@implementation UserCourseListViewPresenter

- (instancetype)initWithView:(id<IUserCourseListView>)view
{
    self = [super init];
    if(self)
    {
        self.view = view;
    }
    
    return self;
}

- (void)loadList
{
    [self.courseList load:^(NSError *error) {
        
        if(error.code == noErr)
        {
            if([self.courseList count] == 0)
            {
                [self.view showBlankView];
            }
            else
            {
                [self.view showListView];
            }
        }
        else
        {
            [self.view showErrorView];
        }
    }];
}

@end
