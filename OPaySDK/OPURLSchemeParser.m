//
//  OPURLSchemeParser.m
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 OPay. All rights reserved.
//

#import "OPURLSchemeParser.h"

@implementation OPURLSchemeParser

#pragma mark - getter

- (NSString *)identifier {
    return _url.host;
}

- (NSString *)scheme {
    return _url.scheme;
}

- (NSDictionary *)parameters {
    return [self parsedDataWithParameter:_url.query];
}

#pragma mark - Initialize

- (instancetype)initWithURL:(NSURL*)url {
    
    self = [super init];
    if (!self) return nil;
    _url = url;
    return self;
}

#pragma mark - private methods

- (NSDictionary*)parsedDataWithParameter:(NSString*)parameter {
    
    if (!parameter || [parameter isEqualToString:@""]) return @{};
    
    // parse parameter
    NSMutableArray *parsedDataArray = [NSMutableArray arrayWithArray:[parameter componentsSeparatedByString:@"&"]];
    
    NSMutableDictionary *parsedDataDic = [NSMutableDictionary new];
    for (NSString *tmpString in parsedDataArray) {
        
        // URL decode
        NSString *parameterString = [tmpString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSRange range = [parameterString rangeOfString:@"="];
        range.length = range.location + 1;
        range.location = 0;
        
        NSString *content = [parameterString stringByReplacingCharactersInRange:range withString:@""];
        NSString *tag = [parameterString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"=%@",content] withString:@""];
        
        [parsedDataDic setObject:content forKey:tag];
    }
    
    return [NSDictionary dictionaryWithDictionary:parsedDataDic];
}

@end
