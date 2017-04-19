//
//  OPURLSchemeParser.h
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import <Foundation/Foundation.h>

/** URL scheme parse */
@interface OPURLSchemeParser : NSObject
/** 用來解析的 Url */
@property (nonatomic, strong, readonly) NSURL *url;
/** 呼叫的 Application scheme */
@property (nonatomic, assign, readonly) NSString *scheme;
/** URL identifier */
@property (nonatomic, assign, readonly) NSString *identifier;
/** 將 url 的參數拆成 dictionary */
@property (nonatomic, assign, readonly) NSDictionary *parameters;

/**
 Initialize

 @param url caller's url
 @return OPURLSchemeParser's singleton instance.
 */
- (instancetype)initWithURL:(NSURL*)url;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end
