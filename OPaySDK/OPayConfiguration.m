//
//  OPayConfiguration.m
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "OPayConfiguration.h"

@implementation OPayConfiguration

+ (instancetype)configurationWithMerchantID:(NSString *)merchantID {
    OPayConfiguration *instance = [super new];
    if (!instance) return nil;
    if (!merchantID || [merchantID isEqualToString:@""]) {
        @throw [[NSException alloc]initWithName:@"Init fail."
                                         reason:@"Invalid merchantID value"
                                       userInfo:nil];
    }
    instance.merchantID = merchantID;
    return instance;
}

+ (instancetype)configurationWithAppID:(NSString *)AppID {
    OPayConfiguration *instance = [super new];
    if (!instance) return nil;
    if (!AppID || [AppID isEqualToString:@""]) {
        @throw [[NSException alloc]initWithName:@"Init fail."
                                         reason:@"Invalid AppID value"
                                       userInfo:nil];
    }
    instance.AppID = AppID;
    return instance;
}

@end
