//
//  CityListTableViewController.m
//  StatusBarWeather
//
//  Created by ZQX on 14/10/22.
//  Copyright (c) 2014年 ZhangQingxin. All rights reserved.
//

#import "CityListTableViewController.h"
#import "AppDelegate.h"
#import "LocaleInfo.h"

@implementation CityListTableViewController


- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)rowIndex {
    return NO;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSMutableArray *citylist = [appDelegate cityList];
    
    if (citylist == nil) {
        return 0;
    }
    return [citylist count];
}


-(id)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSMutableArray *citylist = [appDelegate cityList];
    LocaleInfo *localinfo = [citylist objectAtIndex:row];
    
    
    NSTextField *citytext = [tableView makeViewWithIdentifier:@"CityView" owner:self];
    NSTextField *provincetext = [tableView makeViewWithIdentifier:@"ProvinceView" owner:self];
    NSTextField *countrytext = [tableView makeViewWithIdentifier:@"CountryView" owner:self];
    
    if (citytext == nil) {
        citytext = [[NSTextField alloc] init];
        citytext.identifier = @"CityView";
        [citytext setBordered:false];
        [citytext setBackgroundColor:[NSColor clearColor]];
    }
    
    if (provincetext == nil) {
        provincetext = [[NSTextField alloc] init];
        provincetext.identifier = @"ProvinceView";
        [provincetext setBordered:false];
        [provincetext setBackgroundColor:[NSColor clearColor]];
    }
    
    if (countrytext == nil) {
        countrytext = [[NSTextField alloc] init];
        countrytext.identifier = @"CountryView";
        [countrytext setBordered:false];
        [countrytext setBackgroundColor:[NSColor clearColor]];
    }
    
    NSString* columnIdentifier = [tableColumn identifier];
    
    
    if ([columnIdentifier isEqualToString:@"AutomaticTableColumnIdentifier.0"]) {
        citytext.stringValue = [localinfo city];
        return citytext;
    } else if ([columnIdentifier isEqualToString:@"AutomaticTableColumnIdentifier.1"]) {
        provincetext.stringValue = [localinfo province];
        return provincetext;
    } else if ([columnIdentifier isEqualToString:@"AutomaticTableColumnIdentifier.2"]) {
        countrytext.stringValue = [localinfo country];
        return countrytext;
    }
    
    return nil;
}


- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSTableView *tableView = appDelegate.citylistview;
    NSInteger row = [tableView selectedRow];
    NSLog(@"aasdfasdfasdf=====%ld",row);
    
    NSMutableArray *citylist = [appDelegate cityList];
    LocaleInfo *localinfo = [citylist objectAtIndex:row];
    
    if (row == -1) {
        
    } else {
        NSLog(@"Selected: %@,  WoeId: %@", localinfo.city, localinfo.cityid);
    }
}

@end
