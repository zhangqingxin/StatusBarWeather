//
//  AppDelegate.h
//  StatusBarWeather
//
//  Created by ZQX on 13-11-17.
//  Copyright (c) 2013年 ZhangQingxin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NetworkManager.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *cityNameText;
@property (weak) IBOutlet NSTableView *citylistview;
@property (strong) NSMutableArray *cityList;
@property (strong) NetworkManager *networkManager;



- (IBAction)AddCity:(id)sender;
- (IBAction)inputCityName:(id)sender;
- (IBAction)searchCity:(id)sender;

@end
