#import <Foundation/Foundation.h>

@interface HSUserRegisterInfo_M : NSObject

@property (nonatomic,strong) NSString *certNo; // 身份证
@property (nonatomic,assign) long long createTime; // 创建时间
@property (nonatomic,strong) NSString *ifAccount; // 是否开户
@property (nonatomic,strong) NSString *ifBindcard; // 是否绑卡
@property (nonatomic,strong) NSString *ifFirstbuy; // 是否首次购买
@property (nonatomic,strong) NSString *ifPaypwd; // 是否设置支付密码
@property (nonatomic,strong) NSString *ifRealname; // 是否实名
@property (nonatomic,assign) long long lastTime; // 上次登录时间
@property (nonatomic,strong) NSString *logo; // 用户logo
@property (nonatomic,strong) NSString *mobile; // 手机号
@property (nonatomic,strong) NSString *nick; // 昵称
@property (nonatomic,strong) NSString *anOperator; // 操作人 注意:服务器返回的字段名为operator（为系统关键字）
@property (nonatomic,strong) NSString *password; // 密码
@property (nonatomic,strong) NSString *realName; // 实名
@property (nonatomic,strong) NSString *referee; // 推荐人
@property (nonatomic,strong) NSString *secLevel; // 用户安全等级,如 HIGN
@property (nonatomic,strong) NSString *status; // 用户状态，如 NORMAL
@property (nonatomic,assign) long long updateTime; // 修改时间
@property (nonatomic,strong) NSString *userLevel; // 用户等级，如 NORMAL
@property (nonatomic,strong) NSString *userNo; // 用户编号
@property (nonatomic,strong) NSString *userType; // 用户类型，如 PERSONAL

@property (nonatomic,assign) BOOL ifAccountBool; // 是否开户（YES/NO）
@property (nonatomic,assign) BOOL ifBindcardBool; // 是否绑卡（YES/NO）
@property (nonatomic,assign) BOOL ifFirstbuyBool; // 是否首次购买（YES/NO）
@property (nonatomic,assign) BOOL ifPaypwdBool; // 是否设置支付密码（YES/NO）
@property (nonatomic,assign) BOOL ifRealnameBool; // 是否实名（YES/NO）

- (id)initWithDictionary:(NSDictionary *)dic;

@end
