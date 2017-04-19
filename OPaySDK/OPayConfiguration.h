//
//  OPayConfiguration.h
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import <Foundation/Foundation.h>

/** OPay Configuration */
@interface OPayConfiguration : NSObject
/** 介接廠商會員 ID */
@property (nonatomic, strong) NSString *merchantID;

/**
 Initialize
 
 @param merchantID 介接廠商會員 ID
 @return OMobiPay's instance
 */
+ (instancetype)configurationWithMerchantID:(NSString *)merchantID;

@end
