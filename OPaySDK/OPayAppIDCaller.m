//
//  OPayAppIDCaller.m
//  OPaySDK
//
//  Created by daniel.chen on 2017/9/27.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "OPayAppIDCaller.h"
#import "OPay.h"
#import "OPayApp.h"

#define kThirdPartyAppIDBaseURL @"opay://thirdparty/innerWebView?"

@implementation OPayAppIDCaller

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    _AppID = [OPayApp shared].configuration.AppID;
    if (!_AppID || [_AppID isEqualToString:@""]) {
        @throw [[NSException alloc]initWithName:@"Init fail."
                                         reason:@"Invalid merchantID value"
                                       userInfo:nil];
    }
    return self;
}

- (BOOL)checkoutAppID {
    
    NSString *baseURL = kThirdPartyAppIDBaseURL;
    
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
    
    NSString *urlStr = [NSString stringWithFormat:@"%@APPID=%@",
                        baseURL,
                        _AppID];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:url];
    
    if (canOpenURL) [[UIApplication sharedApplication] openURL:url];
    
    return canOpenURL;
}

@end
