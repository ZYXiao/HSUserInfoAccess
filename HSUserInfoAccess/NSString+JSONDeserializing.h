#import <Foundation/Foundation.h>

@interface NSString (JSONDeserializing)

/**
 原生json字符串转NSDictionary或NSArray

 @return NSDictionary或NSArray
 */
- (id)objectFromJSONString;

@end
