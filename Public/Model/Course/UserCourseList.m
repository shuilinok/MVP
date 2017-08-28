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

@end

@interface UserCourseListLocalLoadAction : MCAction

@end


@interface UserCourseListLocalRemoteLoadAction : MCAction

@end


@interface UserCourseListLoadMoreAction : MCAction

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
    
    MCAction *loadAction = nil;
    
    if(self.paramContext.loadVersion == 0)
    {
        if(self.paramContext.loadMode == 0)
        {
            loadAction = [[UserCourseListRemoteLoadAction alloc] init];
        }
        else if(self.paramContext.loadMode == 1)
        {
            loadAction = [[UserCourseListLocalLoadAction alloc] init];
        }
        else if(self.paramContext.loadMode == 2)
        {
            loadAction = [[UserCourseListLocalRemoteLoadAction alloc] init];
        }
        else if(self.paramContext.loadMode == 3)
        {
            UserCourseListLoadMoreAction *action = [[UserCourseListLoadMoreAction alloc] init];
            action.offset = self.paramContext.offset;
            action.limit = self.paramContext.limit;
            
            loadAction = action;
        }
    }
    else if(self.paramContext.loadVersion == 1)
    {
        
    }
    
    if(loadAction == nil)
    {
        abort();
    }
    
    self.loadAction = loadAction;
    
    [self.loadAction run:self callback:^(NSError *error) {
       
        callback(error);
    }];
}

- (void)cancelLoad
{
    [self.loadAction cancel:700];
}

@end




@implementation UserCourseListRemoteLoadAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    //从服务端加载
    list.paramContext.offset = 0;
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalLoadAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    //从本地加载
    list.paramContext.offset = 0;
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalRemoteLoadAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    list.paramContext.offset = 0;
    
    //先从本地加载
    UserCourseListLocalLoadAction *action = [[UserCourseListLocalLoadAction alloc] init];
    
    [action run:context callback:^(NSError *error) {
       
        if(self.bCancel)
        {
            return;
        }
        
        //再从服务端加载
        UserCourseListRemoteLoadAction *action = [[UserCourseListRemoteLoadAction alloc] init];
        
        [action run:context callback:^(NSError *error) {
            
            [self callbackError:error];
        }];
    }];
}

@end


@implementation UserCourseListLoadMoreAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    //加载更多
    NSUInteger offset = self.offset;
    NSUInteger limit = self.limit;
    
    //...
    
    offset += limit;
    
    list.paramContext.offset = offset;
    
    [self callbackError:nil];
}

@end


