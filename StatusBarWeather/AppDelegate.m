//
//  AppDelegate.m
//  StatusBarWeather
//
//  Created by ZQX on 13-11-17.
//  Copyright (c) 2013年 ZhangQingxin. All rights reserved.
//

#import "AppDelegate.h"
#import "NetworkManager.h"

@implementation AppDelegate

@synthesize cityNameText = _cityNameText;
@synthesize citylistview = _citylistview;
@synthesize cityList = _cityList;
@synthesize networkManager = _networkManager;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self activateStatusIcon];
    _networkManager = [[NetworkManager alloc] init];
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
    [[self networkManager] requestCityId: cityname];
}
@end
