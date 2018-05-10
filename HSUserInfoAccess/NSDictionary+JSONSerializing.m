#import "NSDictionary+JSONSerializing.h"

@implementation NSDictionary (JSONSerializing)

- (NSString *)JSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonStr;
}

@end
