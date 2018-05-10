#import "HSUserRegisterInfo_M.h"

@implementation HSUserRegisterInfo_M

- (id)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        _certNo = [dic objectForKey:@"certNo"];
        _createTime = [[dic objectForKey:@"createTime"] longLongValue];
        _ifAccount = [dic objectForKey:@"ifAccount"];
        _ifBindcard = [dic objectForKey:@"ifBindcard"];
        _ifFirstbuy = [dic objectForKey:@"ifFirstbuy"];
        _ifPaypwd = [dic objectForKey:@"ifPaypwd"];
        _ifRealname = [dic objectForKey:@"ifRealname"];
        _lastTime = [[dic objectForKey:@"lastTime"] longLongValue];
        _logo = [dic objectForKey:@"logo"];
        _mobile = [dic objectForKey:@"mobile"];
        _nick = [dic objectForKey:@"nick"];
        _anOperator = [dic objectForKey:@"operator"];
        _password = [dic objectForKey:@"password"];
        _realName = [dic objectForKey:@"realName"];
        _referee = [dic objectForKey:@"referee"];
        _secLevel = [dic objectForKey:@"secLevel"];
        _status = [dic objectForKey:@"status"];
        _updateTime = [[dic objectForKey:@"updateTime"] longLongValue];
        _userLevel = [dic objectForKey:@"userLevel"];
        _userNo = [dic objectForKey:@"userNo"];
        _userType = [dic objectForKey:@"userType"];
    }
    
    return self;
}

- (BOOL)ifAccountBool {
    if ([_ifAccount isEqualToString:@"YES"]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)ifBindcardBool {
    if ([_ifBindcard isEqualToString:@"BIND"]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)ifFirstbuyBool {
    if ([_ifFirstbuy isEqualToString:@"YES"]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)ifPaypwdBool {
    if ([_ifPaypwd isEqualToString:@"YES"]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)ifRealnameBool {
    if ([_ifRealname isEqualToString:@"YES"]) {
        return YES;
    }
    else {
        return NO;
    }
}



@end
