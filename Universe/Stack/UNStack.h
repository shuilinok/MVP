//
//  UNStack.h
//  MoneyCalculator
//
//  Created by shuilin on 4/6/17.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UNStack : NSObject

- (id)pop;

- (void)push:(id)object;

- (id)topObject;

@end
