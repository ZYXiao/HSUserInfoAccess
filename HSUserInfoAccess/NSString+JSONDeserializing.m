#import "NSString+JSONDeserializing.h"

@implementation NSString (JSONDeserializing)

- (id)objectFromJSONString {
    if (!self || !self.length) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id returnObj = [NSJSONSerialization JSONObjectWithData:jsonData
                                                   options:NSJSONReadingMutableContainers
                                                     error:&err];
    return (err ? nil : returnObj);
}

@end
