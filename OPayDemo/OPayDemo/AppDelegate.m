//
//  AppDelegate.m
//  OPayDemo
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "AppDelegate.h"
#import "OPay.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [OPayApp shared].configuration = [OPayConfiguration configurationWithMerchantID:kMerchantID];
//    [OPayApp shared].configuration.environment = OPayEnvironmentStage;
    
    BOOL launch = [[OPayApp shared] application:application didFinishLaunchingWithOptions:launchOptions];
    
    return launch;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    BOOL openURL = [[OPayApp shared] application:app openURL:url options:options];
    return openURL;
}

@end
