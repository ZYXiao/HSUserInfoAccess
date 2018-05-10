#import "HSUserInfoAccess.h"
#import "NSString+JSONDeserializing.h"
#import "NSDictionary+JSONSerializing.h"
#import "NSObject+Convert.h"
#import <UIKit/UIKit.h>

NSString *const HSUserLoginSuccessNotification = @"Login_Success";
NSString *const HSUserLogoutSuccessNotification = @"Logout_Success";

NSString *const HSUserInfoKey = @"userInfo";
NSString *const HSLoginInfoKey = @"userLoginInfoBizPojo";
NSString *const HSRegisterInfoKey = @"userRegisterInfoBizPojo";

@interface HSUserInfoAccess ()

@property (nonatomic,strong) NSString * (^encoder)(NSString *input);
@property (nonatomic,strong) NSString * (^decoder)(NSString *input);

@end

@implementation HSUserInfoAccess

static HSUserInfoAccess *instance = nil;

+ (HSUserInfoAccess *)shareInstanceWithEncoder:(NSString * (^)(NSString *input))encoder
                                       decoder:(NSString * (^)(NSString *input))decoder {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HSUserInfoAccess alloc] initWithEncoder:encoder decoder:decoder];
    });
    return instance;
}

+ (HSUserInfoAccess *)shareInstance {
    return instance;
}

- (id)initWithEncoder:(NSString * (^)(NSString *input))encoder
              decoder:(NSString * (^)(NSString *input))decoder {
    if (self = [super init]) {
        NSAssert(encoder, @"encoder不能为假");
        NSAssert(decoder, @"decoder不能为假");
        _encoder = encoder;
        _decoder = decoder;
        NSString *encodedJson = [[NSUserDefaults standardUserDefaults] objectForKey:HSUserInfoKey];
        if (encodedJson.length) {
            NSString *json = _decoder(encodedJson);
            NSDictionary *userInfo = [json objectFromJSONString];
            _loginInfo = [[HSUserLoginInfo_M alloc] initWithDictionary:userInfo[HSLoginInfoKey]];
            _registerInfo = [[HSUserRegisterInfo_M alloc] initWithDictionary:userInfo[HSRegisterInfoKey]];
            [self setUpListeners];
        }
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setUpListeners {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillTerminateNotification:)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
}

- (void)loginSuccess:(NSDictionary *)userInfo {
    _loginInfo = userInfo[HSLoginInfoKey];
    _registerInfo = userInfo[HSRegisterInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:HSUserLoginSuccessNotification object:nil];
}

- (void)logoutSuccess {
    _loginInfo = nil;
    _registerInfo = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:HSUserLogoutSuccessNotification object:nil];
}

- (BOOL)userHaveLogin {
    if (_loginInfo && _registerInfo) {
        return YES;
    }
    return NO;
}

- (void)updateRegisterInfoWithKeyValues:(NSDictionary *)keyValues {
    if (![self userHaveLogin]) {
        return;
    }
    NSArray *allKeys = [keyValues allKeys];
    for (NSString *key in allKeys) {
        id value = keyValues[key];
        [_registerInfo setValue:value forKey:key];
    }
}

- (void)persistentStores {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithCapacity:2];
    if (_loginInfo) {
        [userInfo setObject:[_loginInfo convertToDictionary] forKey:HSLoginInfoKey];
    }
    if (_registerInfo) {
        [userInfo setObject:[_registerInfo convertToDictionary] forKey:HSRegisterInfoKey];
    }
    NSString *json = [(NSDictionary *)userInfo JSONString];
    NSString *encodedJson = _encoder(json);
    [[NSUserDefaults standardUserDefaults] setObject:encodedJson forKey:HSUserInfoKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - handle notification
- (void)applicationWillTerminateNotification:(NSNotification *)notification {
    [self persistentStores];
}


@end
