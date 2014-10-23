//
//  AppDelegate.m
//  StatusBarWeather
//
//  Created by ZQX on 13-11-17.
//  Copyright (c) 2013年 ZhangQingxin. All rights reserved.
//

#import "AppDelegate.h"
#import "DataManager.h"

@implementation AppDelegate

@synthesize cityNameText = _cityNameText;
@synthesize citylistview = _citylistview;
@synthesize cityList = _cityList;
@synthesize dataManager = _dataManager;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self activateStatusIcon];
    _dataManager = [[DataManager alloc] init];
}





- (void)activateStatusIcon
{
    
}

- (IBAction)AddCity:(id)sender {
}

- (IBAction)inputCityName:(id)sender {
}

- (IBAction)searchCity:(id)sender {
    NSString *cityname = [_cityNameText stringValue];
    [[self dataManager] requestCityId: cityname];
}
@end
