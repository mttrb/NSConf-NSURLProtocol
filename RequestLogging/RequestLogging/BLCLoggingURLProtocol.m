//
//  BLCLoggingURLProtocol.m
//  Request Logging
//
//  Created by Matthew Robinson on 12/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import "BLCLoggingURLProtocol.h"

@implementation BLCLoggingURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSLog(@"%@", request);
    
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

@end
