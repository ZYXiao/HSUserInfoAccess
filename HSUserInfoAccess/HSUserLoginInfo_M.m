#import "HSUserLoginInfo_M.h"

@implementation HSUserLoginInfo_M

- (id)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        _account = [dic objectForKey:@"account"];
        _accountType = [dic objectForKey:@"accountType"];
        _cartularyId = [dic objectForKey:@"cartularyId"];
        _createTime = [[dic objectForKey:@"createTime"] longLongValue];
        _status = [dic objectForKey:@"status"];
        _updateTime = [[dic objectForKey:@"updateTime"] longLongValue];
        _userNo = [dic objectForKey:@"userNo"];
    }
    
    return self;
}

@end
