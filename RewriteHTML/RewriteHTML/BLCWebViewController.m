//
//  BLCWebViewController.m
//  Request Logging
//
//  Created by Matthew Robinson on 12/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import "BLCWebViewController.h"

@implementation BLCWebViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    webView.scalesPageToFit = YES;
    
    self.view = webView;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com"]];
    
    [webView loadRequest:request];
}

@end
