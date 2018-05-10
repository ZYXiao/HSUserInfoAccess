#import <Foundation/Foundation.h>

@interface HSUserLoginInfo_M : NSObject

@property (nonatomic,strong) NSString *account;  // 账号
@property (nonatomic,strong) NSString *accountType; // 账号类型，如MOBILE
@property (nonatomic,strong) NSString *cartularyId; // 登录簿ID
@property (nonatomic,assign) long long createTime; // 创建时间
@property (nonatomic,strong) NSString *status; // 状态，如NORMAL
@property (nonatomic,assign) long long updateTime; // 修改时间
@property (nonatomic,strong) NSString *userNo; // 用户编号

- (id)initWithDictionary:(NSDictionary *)dic;

@end
