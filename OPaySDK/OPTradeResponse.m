//
//  OPTradeResponse.m
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "OPTradeResponse.h"

@implementation OPTradeResponse

+ (instancetype)responseWithRtnCode:(NSString *)rtnCode
                             rtnMsg:(NSString *)rtnMsg
                         tradeToken:(NSString *)tradeToken
                        encryptData:(NSString *)encryptData {
    
    OPTradeResponse *instance = [OPTradeResponse new];
    if (!instance) return nil;
    [instance setDataWithRtnCode:rtnCode rtnMsg:rtnMsg tradeToken:tradeToken encryptData:encryptData];
    return instance;
}

#pragma mark - private method

- (void)setDataWithRtnCode:(NSString *)rtnCode
                    rtnMsg:(NSString *)rtnMsg
                tradeToken:(NSString *)tradeToken
               encryptData:(NSString *)encryptData {
    
    _rtnCode = rtnCode;
    _rtnMsg = rtnMsg;
    _tradeToken = tradeToken;
    _encryptData = encryptData;
}

@end
