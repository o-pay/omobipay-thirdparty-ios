//
//  OPayTradeCaller.h
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 呼叫歐付寶進行付款 */
@interface OPayTradeCaller : NSObject
/** 介接廠商會員 ID */
@property (nonatomic, strong ,readonly) NSString *merchantID;

/**
 呼叫歐付寶 App 進行付款。
 
 @param tradeToken trade token
 @param redirectURL call back 所需的 URL
 @return call canOpenURL result
 */
- (BOOL)checkoutWithTradeToken:(NSString*)tradeToken
                   redirectURL:(NSString*)redirectURL;

@end
