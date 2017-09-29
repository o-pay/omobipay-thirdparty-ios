//
//  OPayAppIDCaller.h
//  OPaySDK
//
//  Created by daniel.chen on 2017/9/27.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 呼叫歐付寶進行付款 */
@interface OPayAppIDCaller : NSObject

/** 介接廠商 App ID */
@property (nonatomic, strong) NSString *AppID;

/**
 呼叫歐付寶 App 進行付款。
 
 @return call canOpenURL result
 */
- (BOOL)checkoutAppID;

@end
