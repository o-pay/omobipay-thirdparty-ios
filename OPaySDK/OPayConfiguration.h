//
//  OPayConfiguration.h
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    OPayEnvironmentProduction,
    OPayEnvironmentStage,
    OPayEnvironmentBeta
} OPayEnvironment;

/** OPay Configuration */
@interface OPayConfiguration : NSObject
/** 介接廠商會員 ID */
@property (nonatomic, strong) NSString *merchantID;
/** 介接廠商 App ID */
@property (nonatomic, strong) NSString *AppID;
/** 依據設定開啟不同環境的行動支付APP */
@property (nonatomic, assign) OPayEnvironment environment;

/**
 Initialize
 
 @param merchantID 介接廠商會員 ID
 @return OMobiPay's instance
 */
+ (instancetype)configurationWithMerchantID:(NSString *)merchantID;

/**
 Initialize
 
 @param AppID 介接廠商 App ID
 @return OMobiPay's instance
 */
+ (instancetype)configurationWithAppID:(NSString *)AppID;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

@end
