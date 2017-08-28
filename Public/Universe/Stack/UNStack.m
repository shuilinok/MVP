//
//  UNStack.m
//  MoneyCalculator
//
//  Created by shuilin on 4/6/17.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "UNStack.h"

@interface UNStack ()
@property (strong, nonatomic) NSMutableArray *objects;
@end

@implementation UNStack

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)pop
{
    id object = [self.objects lastObject];
    [self.objects removeLastObject];
    
    return object;
}

- (void)push:(id)object
{
    if(object)
    {
        [self.objects addObject:object];
    }
}

- (id)topObject
{
    id object = [self.objects lastObject];
    
    return object;
}

@end
