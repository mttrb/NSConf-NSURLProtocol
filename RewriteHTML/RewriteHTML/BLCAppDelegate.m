//
//  BLCAppDelegate.m
//  RewriteHTML
//
//  Created by Matthew Robinson on 15/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import "BLCAppDelegate.h"

#import "BLCRewriteURLProtocol.h"
#import "BLCWebViewController.h"

@implementation BLCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSURLProtocol registerClass:[BLCRewriteURLProtocol class]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [BLCWebViewController new];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
