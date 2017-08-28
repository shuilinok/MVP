//
//  DictionaryHelper.h
//  Producer
//
//  Created by shuilin on 8/18/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictionaryHelper : NSObject

+ (void)dictionary:(NSMutableDictionary *)dict setObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end
