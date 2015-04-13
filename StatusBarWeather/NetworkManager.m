//
//  NetworkManager.m
//  StatusBarWeather
//
//  Created by ZQX on 13-11-23.
//  Copyright (c) 2013年 ZhangQingxin. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"
#import "Constants.h"
#import "LocaleInfo.h"
#import "AppDelegate.h"

@implementation NetworkManager


- (void)requestCityId: (NSString *)cityname {

    NSString *querywoeid = [[NSString alloc]initWithFormat:@"select name,country,woeid,admin1 from geo.places where text='%@'",cityname];
    NSString *urlstr = [YAHOO_API_URL stringByAppendingString:querywoeid];
    
    
    NSURL *url = [NSURL URLWithString:[urlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request CityId : %@",url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSMutableArray *citylist = [[NSMutableArray alloc]init];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *city = (NSDictionary *)responseObject;
        NSDictionary *query = [city objectForKey:@"query"];
        NSDictionary *result = [query objectForKey:@"results"];
        NSArray *placelist = [result objectForKey:@"place"];
        

        for(id obj in placelist){
            LocaleInfo *info = [[LocaleInfo alloc] init];
            NSDictionary *placeDic = (NSDictionary *)obj;
            info.city = [placeDic objectForKey:@"name"];
            info.cityid = [placeDic objectForKey:@"woeid"];
            
            NSDictionary *proviceDic = [placeDic objectForKey:@"admin1"];
            info.province = [proviceDic objectForKey:@"content"];
            info.provinceid = [proviceDic objectForKey:@"woeid"];
            
            NSDictionary *countryDic = [placeDic objectForKey:@"country"];
            info.country = [countryDic objectForKey:@"content"];
            info.countryid = [countryDic objectForKey:@"woeid"];
            
            [citylist addObject:info];
        }
        
        AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
        [appDelegate setCityList:citylist];
        [[appDelegate citylistview] reloadData];
        
        NSLog(@"City Size:   %lu", [citylist count]);
        for (id obj in citylist) {
            LocaleInfo *info = (LocaleInfo *)obj;
            NSLog(@"City: %@    Province: %@    Country: %@", info.city, info.province, info.country);
            NSLog(@"CityID: %@    ProvinceID: %@    CountryID: %@",info.cityid, info.provinceid, info.countryid);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //TODO: 需要处理访问失败的情况
    }];
    
    [operation start];
}

-(void)requestWeatherData:(NSString *)woeid {
    NSString *querywoeid = [[NSString alloc]initWithFormat:@"select location,units,item from weather.forecast where woeid='%@'",woeid];
    NSString *urlstr = [YAHOO_API_URL stringByAppendingString:querywoeid];
    NSURL *url = [NSURL URLWithString:[urlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request Weather : %@",url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSMutableArray *weatherlist = [[NSMutableArray alloc]init];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *weather = (NSDictionary *)responseObject;
        NSDictionary *query = [weather objectForKey:@"query"];
        NSDictionary *result = [query objectForKey:@"results"];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //TODO: 需要处理访问失败的情况
    }];
    
    [operation start];
}

@end
