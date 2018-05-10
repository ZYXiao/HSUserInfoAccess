#import "NSObject+Convert.h"
#import <objc/runtime.h>

@implementation NSObject (Convert)

- (NSDictionary *)convertToDictionary {
    if (self == nil) {
        return nil;
    }
    NSMutableDictionary *returnDic = [NSMutableDictionary dictionary];
    unsigned int propsCount; // 属性数量
    objc_property_t *props = class_copyPropertyList([self class], &propsCount);
    for(int i = 0; i < propsCount; i++) {
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [self valueForKey:propName];
        if(value) {
            [returnDic setObject:value forKey:propName];
        }
    }
    return returnDic;
}

@end
