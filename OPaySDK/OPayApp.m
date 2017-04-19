//
//  OPayApp.m
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "OPayApp.h"
#import "OPURLSchemeParser.h"

#define kOPBundleID @"tw.com.allpay.app.AllPay"
#define kOPEpBundleID @"tw.com.allpay.ep.AllPay"

@interface OPayApp ()
@property (nonatomic, strong) OPTradeResponse *tradeResponse;
@end

static OPayApp *_sharedInstace;

@implementation OPayApp

#pragma mark - getter

- (OPTradeResponse *)tradeResponse {
    OPTradeResponse *response = _tradeResponse;
    _tradeResponse = nil;
    return response;
}

#pragma mark - singleton

+ (instancetype)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstace = [OPayApp new];
    });
    
    return _sharedInstace;
}

#pragma mark - AppDelegate methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSURL *url = [launchOptions objectForKey:@"UIApplicationLaunchOptionsURLKey"];
    [self setResponseWithURL:url];
    
    return true;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_9_3

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
    if (![self checkValidSourceApplication:sourceApplication]) return false;
    
    [self setResponseWithURL:url];
    
    return true;
}

#else

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    if (![self checkValidSourceApplication:sourceApplication]) return false;
    
    [self setResponseWithURL:url];
    
    return true;
}

#endif

#pragma mark - private methods - trade

- (BOOL)checkValidSourceApplication:(NSString*)sourceApplication {
    return [sourceApplication isEqualToString:kOPBundleID] ||
    [sourceApplication isEqualToString:kOPEpBundleID];
}

- (void)setResponseWithURL:(NSURL *)url {
    
    OPURLSchemeParser *parser = [[OPURLSchemeParser alloc] initWithURL:url];
    NSDictionary *dic = parser.parameters;
    
    NSString *rtnCode = dic[@"RtnCode"];
    NSString *rtnMsg = dic[@"RtnMsg"];
    NSString *tradeToken = dic[@"TradeToken"];
    NSString *data = dic[@"Data"];
    
    _tradeResponse = [OPTradeResponse responseWithRtnCode:rtnCode rtnMsg:rtnMsg tradeToken:tradeToken encryptData:data];
}

@end
