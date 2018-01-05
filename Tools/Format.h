//
//  Format.h
//
//  Created by Boris Polania on 4/4/17.
//  Copyright © 2017 Boris Polania. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Format : NSObject

+ (NSString *)getMethodId:(NSString *)sha3;
+ (NSString *)encodeUInt256ArgumentValue:(int)value;
+ (NSString *)hexToString:(NSData *)hex;

@end
