#import <Foundation/Foundation.h>
#import "HSUserLoginInfo_M.h"
#import "HSUserRegisterInfo_M.h"

#define UserInfoAccess [HSUserInfoAccess shareInstance]

extern NSString *const HSUserLoginSuccessNotification;
extern NSString *const HSUserLogoutSuccessNotification;

extern NSString *const HSUserInfoKey;
extern NSString *const HSLoginInfoKey;
extern NSString *const HSRegisterInfoKey;

@interface HSUserInfoAccess : NSObject

@property (nonatomic,strong) HSUserLoginInfo_M *loginInfo;
@property (nonatomic,strong) HSUserRegisterInfo_M *registerInfo;

+ (HSUserInfoAccess *)shareInstanceWithEncoder:(NSString * (^)(NSString *input))encoder
                                       decoder:(NSString * (^)(NSString *input))decoder;
+ (HSUserInfoAccess *)shareInstance;

- (void)loginSuccess:(NSDictionary *)userInfo;
- (void)logoutSuccess;

- (BOOL)userHaveLogin;

- (void)updateRegisterInfoWithKeyValues:(NSDictionary *)keyValues;

- (void)persistentStores;

@end
