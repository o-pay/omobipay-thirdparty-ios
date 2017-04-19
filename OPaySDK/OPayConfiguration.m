//
//  OPayConfiguration.m
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "OPayConfiguration.h"

@implementation OPayConfiguration

+ (instancetype)configurationWithMerchantID:(NSString *)merchantID {
    OPayConfiguration *instance = [OPayConfiguration new];
    if (!instance) return nil;
    if (!merchantID || [merchantID isEqualToString:@""]) {
        @throw [[NSException alloc]initWithName:@"Init fail."
                                         reason:@"Invalid merchantID value"
                                       userInfo:nil];
    }
    instance.merchantID = merchantID;
    return instance;
}

@end
