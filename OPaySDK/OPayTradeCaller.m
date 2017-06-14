//
//  OPayTradeCaller.m
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "OPayTradeCaller.h"
#import "OPay.h"
#import "OPayApp.h"

#define kThirdPartyBaseURL @"opay://checkout?"

@implementation OPayTradeCaller

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    _merchantID = [OPayApp shared].configuration.merchantID;
    if (!_merchantID || [_merchantID isEqualToString:@""]) {
        @throw [[NSException alloc]initWithName:@"Init fail."
                                         reason:@"Invalid merchantID value"
                                       userInfo:nil];
    }
    return self;
}

- (BOOL)checkoutWithTradeToken:(NSString*)tradeToken
                   redirectURL:(NSString*)redirectURL {
    
    NSString *baseURL = kThirdPartyBaseURL;
    
    switch ([OPayApp shared].configuration.environment) {
        case OPayEnvironmentStage:
            baseURL = [baseURL stringByReplacingOccurrencesOfString:@"opay" withString:@"opay-stage"];
            break;
        case OPayEnvironmentBeta:
            baseURL = [baseURL stringByReplacingOccurrencesOfString:@"opay" withString:@"opay-beta"];
            break;
            
        default:
            break;
    }

    NSString *urlStr = [NSString stringWithFormat:@"%@MerchantID=%@&Version=%@&TradeToken=%@&redirectURL=%@",
                        baseURL,
                        _merchantID,
                        kSDKVersion,
                        tradeToken,
                        redirectURL];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:url];
    
    if (canOpenURL) [[UIApplication sharedApplication] openURL:url];
    
    return canOpenURL;
}

@end
