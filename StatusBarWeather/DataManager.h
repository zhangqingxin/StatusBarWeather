//
//  DataManager.h
//  StatusBarWeather
//
//  Created by ZQX on 13-11-23.
//  Copyright (c) 2013年 ZhangQingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface DataManager : NSObject

-(void)requestCityId: (NSString *)cityname;
-(void) requestWeatherData: (NSString *) cityname;

@end
