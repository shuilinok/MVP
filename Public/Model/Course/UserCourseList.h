//
//  UserCourseList.h
//  Research
//
//  Created by shuilin on 20/07/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCourse.h"

@class User;

@interface UserCourseListParamContext : NSObject

@property (assign, nonatomic) NSUInteger loadVersion;//0,1,2...

@property (assign, nonatomic) NSUInteger loadMode;//0服务端，1本地，2本地服务端，3更多

@property (assign, nonatomic) NSUInteger offset;

@property (assign, nonatomic) NSUInteger limit;

@end


@interface UserCourseList : NSObject

@property (weak, nonatomic) User *user;

@property (readonly, strong, nonatomic) UserCourseListParamContext *paramContext;

- (NSUInteger)count;

- (void)setWithInfos:(NSArray *)infos;

- (void)load:(ResultCallback)callback;

- (void)cancelLoad;

@end





