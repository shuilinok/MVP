//
//  UserCourseList.m
//  Research
//
//  Created by shuilin on 20/07/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "UserCourseList.h"
#import "User.h"


@interface UserCourseListRemoteLoadAction : MCAction

@property (weak, nonatomic) UserCourseList *list;
@end

@interface UserCourseListLocalLoadAction : MCAction

@property (weak, nonatomic) UserCourseList *list;
@end


@interface UserCourseListLocalRemoteLoadAction : MCAction

@property (weak, nonatomic) UserCourseList *list;
@end


@interface UserCourseListLoadMoreAction : MCAction

@property (weak, nonatomic) UserCourseList *list;

@property (assign, nonatomic) NSUInteger offset;

@property (assign, nonatomic) NSUInteger limit;

@end


@implementation UserCourseListParamContext

@end


@interface UserCourseList ()

@property (strong, nonatomic) NSMutableArray *courses;

@property (strong, nonatomic) MCAction *loadAction;

@property (strong, nonatomic) UserCourseListParamContext *paramContext;

@end


@implementation UserCourseList

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.courses = [[NSMutableArray alloc] init];
        self.paramContext = [[UserCourseListParamContext alloc] init];
    }
    
    return self;
}

- (void)setWithInfos:(NSArray *)infos
{
    [self.courses removeAllObjects];
    
    for(CourseInfo *info in infos)
    {
        UserCourse *course = [[UserCourse alloc] init];
        [course setWithInfo:info];
        
        [self.courses addObject:course];
    }
}

- (void)load:(ResultCallback)callback
{
    [self.loadAction cancel:800];//把原来的取消
    
    self.loadAction = nil;
    
    if(self.paramContext.loadVersion == 0)
    {
        if(self.paramContext.loadMode == 0)
        {
            UserCourseListRemoteLoadAction *action = [[UserCourseListRemoteLoadAction alloc] init];
            action.list = self;
            self.loadAction = action;
        }
        else if(self.paramContext.loadMode == 1)
        {
            UserCourseListLocalLoadAction *action = [[UserCourseListLocalLoadAction alloc] init];
            action.list = self;
            self.loadAction = action;
        }
        else if(self.paramContext.loadMode == 2)
        {
            UserCourseListLocalRemoteLoadAction *action = [[UserCourseListLocalRemoteLoadAction alloc] init];
            action.list = self;
            self.loadAction = action;
        }
        else if(self.paramContext.loadMode == 3)
        {
            UserCourseListLoadMoreAction *action = [[UserCourseListLoadMoreAction alloc] init];
            action.list = self;
            action.offset = self.paramContext.offset;
            action.limit = self.paramContext.limit;
            
            self.loadAction = action;
        }
    }
    else if(self.paramContext.loadVersion == 1)
    {
        
    }
    
    if(self.loadAction == nil)
    {
        abort();
    }
    
    [self.loadAction run:^(NSError *error) {
       
        callback(error);
    }];
}

- (void)cancelLoad
{
    [self.loadAction cancel:700];
}

@end




@implementation UserCourseListRemoteLoadAction

- (void)run
{
    UserCourseList *list = self.list;
    
    //从服务端加载
    list.paramContext.offset = 0;
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalLoadAction

- (void)run
{
    UserCourseList *list = self.list;
    
    //从本地加载
    list.paramContext.offset = 0;
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalRemoteLoadAction

- (void)run
{
    UserCourseList *list = self.list;
    
    list.paramContext.offset = 0;
    
    //先从本地加载
    UserCourseListLocalLoadAction *action = [[UserCourseListLocalLoadAction alloc] init];
    
    [action run:^(NSError *error) {
       
        if(self.bCancel)
        {
            return;
        }
        
        //再从服务端加载
        UserCourseListRemoteLoadAction *action = [[UserCourseListRemoteLoadAction alloc] init];
        
        [action run:^(NSError *error) {
            
            [self callbackError:error];
        }];
    }];
}

@end


@implementation UserCourseListLoadMoreAction

- (void)run
{
    UserCourseList *list = self.list;
    
    //加载更多
    NSUInteger offset = self.offset;
    NSUInteger limit = self.limit;
    
    //...
    
    offset += limit;
    
    list.paramContext.offset = offset;
    
    [self callbackError:nil];
}

@end


