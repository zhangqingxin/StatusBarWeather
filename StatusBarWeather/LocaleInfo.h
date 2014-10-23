//
//  LocaleInfo.h
//  StatusBarWeather
//
//  Created by ZQX on 13-11-23.
//  Copyright (c) 2013年 ZhangQingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocaleInfo : NSObject

@property(nonatomic, strong) NSString* city;
@property(nonatomic, strong) NSString* province;
@property(nonatomic, strong) NSString* country;

@property(nonatomic, strong) NSString* cityid;
@property(nonatomic, strong) NSString* provinceid;
@property(nonatomic, strong) NSString* countryid;

@end
