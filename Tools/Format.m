//
//  Format.m
//
//  Created by Boris Polania on 4/4/17.
//  Copyright © 2017 Boris Polania. All rights reserved.
//

#import "Format.h"

@implementation Format

/*!
 * @brief Decodes string from URL encoding
 * @param sha3 the string with the SHA3 of the function description
 * @return the method ID
 */
+ (NSString *)getMethodId:(NSString *)sha3 {
    return [sha3 substringWithRange:NSMakeRange(2, 8)];
}

/*!
 * @brief Ethereum Contract ABI encoding for UInt256 types so it's correctly padded to the left
 * @param value the integer value to encode
 * @return then encoded string
 */
+ (NSString *)encodeUInt256ArgumentValue:(int)value {
    return [NSString stringWithFormat:@"%064d",value];
}

/*!
 * @brief Converts NSData to a Hex String
 * @param hex the the NSData to be converted
 * @return the resulting string
 */
+ (NSString *)hexToString:(NSData *)hex {
    NSUInteger length = hex.length;
    unichar* hexChars = (unichar*)malloc(sizeof(unichar) * (length*2));
    unsigned char* bytes = (unsigned char*)hex.bytes;
    for (NSUInteger i = 0; i < length; i++) {
        unichar c = bytes[i] / 16;
        if (c < 10) {
            c += '0';
        } else {
            c += 'A' - 10;
        }
        hexChars[i*2] = c;
        
        c = bytes[i] % 16;
        if (c < 10) {
            c += '0';
        } else {
            c += 'A' - 10;
        }
        hexChars[i*2+1] = c;
    }
    return  [[[NSString alloc] initWithCharactersNoCopy:hexChars length:length*2 freeWhenDone:YES] lowercaseString];
}

@end
