//
//  OPTradeResponse.h
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import <Foundation/Foundation.h>

/** OPay trade response */
@interface OPTradeResponse : NSObject
/** OPay trade return code */
@property (nonatomic, strong, readonly, nonnull) NSString *rtnCode;
/** OPay trade return message */
@property (nonatomic, strong, readonly, nonnull) NSString *rtnMsg;
/** OPay trade token */
@property (nonatomic, strong, readonly, nonnull) NSString *tradeToken;
/** OPay trade encrypt data */
@property (nonatomic, strong, readonly, nullable) NSString *encryptData;

/**
 Initialize

 @param rtnCode return code
 @param rtnMsg return message
 @param tradeToken trade token
 @param encryptData trade encrypt data
 @return OPPaymentResponse's instance
 */
+ (nonnull instancetype)responseWithRtnCode:(nonnull NSString*)rtnCode
                                     rtnMsg:(nonnull NSString*)rtnMsg
                                 tradeToken:(nonnull NSString*)tradeToken
                                encryptData:(nullable NSString*)encryptData;
@end
