//
//  BLCAppDelegate.m
//  Request Logging
//
//  Created by Matthew Robinson on 12/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import "BLCAppDelegate.h"

#import "BLCLoggingURLProtocol.h"
#import "BLCWebViewController.h"

@implementation BLCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSURLProtocol registerClass:[BLCLoggingURLProtocol class]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [BLCWebViewController new];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
