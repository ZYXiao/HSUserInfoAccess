#import <Foundation/Foundation.h>

@interface NSDictionary (JSONSerializing)

/**
 字典转json字符串

 @return json字符串
 */
- (NSString *)JSONString;

@end
