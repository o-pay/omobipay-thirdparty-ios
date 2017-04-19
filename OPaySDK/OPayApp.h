//
//  OPayApp.h
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OPTradeResponse.h"
#import "OPayConfiguration.h"

/** OPayApp 是一個 Singleton 物件，紀錄所需的資料，處理交易回傳的相關事件。 */
@interface OPayApp : NSObject

/** 存放歐付寶所需的相關設定 */
@property (nonatomic, strong) OPayConfiguration *configuration;

/**
 Get singleton instance

 @return singleton instance
 */
+ (instancetype)shared;

/**
 取得來自歐付寶的交易相關的資料，取值之後則會設定為nil。

 @return response
 */
- (OPTradeResponse *)tradeResponse;

/**
 如果有需要接收歐付寶交易後的相關資料，請在您的 AppDelegate 中的 [UIApplicationDelegate application:openURL:sourceApplication:annotation:] 呼叫這個方法。處理完成後的資料請透過 tradeResponse 這個物件方法取出。

 @param application The application as passed to [UIApplicationDelegate application:openURL:sourceApplication:annotation:].
 @param launchOptions The launchOptions as passed to [UIApplicationDelegate application:didFinishLaunchingWithOptions:].
 @return YES if the url was intended for the OPay, NO if not.
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_9_3

/**
 如果有需要接收歐付寶交易後的相關資料，請在您的 AppDelegate 中的 [UIApplicationDelegate application:openURL:options:] 呼叫這個方法。處理完成後的資料請透過 tradeResponse 這個物件方法取出。

 @param app The application as passed to [UIApplicationDelegate application:openURL:options:].
 @param url The URL as passed to [UIApplicationDelegate application:openURL:options:].
 @param options The options dictionary as passed to [UIApplicationDelegate application:openURL:options:].
 @return YES if the url was intended for the OPay, NO if not.
 */
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;
#else

/**
 如果有需要接收歐付寶交易後的相關資料，請在您的 AppDelegate 中的 [UIApplicationDelegate application:openURL:sourceApplication:annotation:] 呼叫這個方法。處理完成後的資料請透過 tradeResponse 這個物件方法取出。

 @param application The application as passed to [UIApplicationDelegate application:openURL:sourceApplication:annotation:].
 @param url The URL as passed to [UIApplicationDelegate application:openURL:sourceApplication:annotation:].
 @param sourceApplication The sourceApplication as passed to [UIApplicationDelegate application:openURL:sourceApplication:annotation:].
 @param annotation The annotation as passed to [UIApplicationDelegate application:openURL:sourceApplication:annotation:].
 @return YES if the url was intended for the OPay, NO if not.
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
#endif

@end
