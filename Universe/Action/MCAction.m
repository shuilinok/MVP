//
//  MCAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 02/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "MCAction.h"

@interface MCAction ()

//是否取消运行
@property (assign, nonatomic) BOOL bCancel;

//运行完后回调函数，外部不要设置，由子类设置
@property (copy, nonatomic) ResultCallback callback;

@end

@implementation MCAction

- (void)callbackError:(NSError *)error
{
    if(self.callback)
    {
        self.callback(error);
        self.callback = nil;
    }
}

//取消
- (void)cancel:(NSUInteger)code
{
    self.bCancel = YES;
    
    NSError *error = [NSError errorWithCode:code xtmsg:@"操作被取消"];
    [self callbackError:error];
}

- (void)run:(ResultCallback)callback
{
    self.callback = callback;
    
    [self run];
}

//运行，子类重写
- (void)run
{
    //...
}

@end



