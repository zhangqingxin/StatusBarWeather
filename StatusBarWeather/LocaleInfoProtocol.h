//
//  LocaleInfoProtocol.h
//  StatusBarWeather
//
//  Created by ZQX on 14/10/20.
//  Copyright (c) 2014年 ZhangQingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LocaleInfoProtocol <NSObject>

-(void) onLocaleDataCallback:(NSString *) cityname Citylist:(NSArray *) citylist;

@end
