//
//  MCAction.h
//  AudioPlayerDemo
//
//  Created by shuilin on 02/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>


//行为抽象，包含：运行，回调，取消
@interface MCAction : NSObject

//运行，外部调用
- (void)run:(ResultCallback)callback;

//取消运行，子类可重写
- (void)cancel:(NSUInteger)code;

//运行，子类重写
- (void)run;

@end



@interface MCAction (Protected)

//是否取消运行，子类读
@property (readonly, assign, nonatomic) BOOL bCancel;

//运行完后返回，外部不要调用，子类也不要重写，子类调用
- (void)callbackError:(NSError *)error;

@end
