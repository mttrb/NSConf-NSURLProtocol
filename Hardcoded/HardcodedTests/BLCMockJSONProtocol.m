//
//  BLCMockJSONProtocol.m
//  Unit Tests
//
//  Created by Matthew Robinson on 15/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import "BLCMockJSONProtocol.h"

NSString * const URLString = @"http://example.com/data.json";

@implementation BLCMockJSONProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSString *URL = [request.URL absoluteString];
    
    if ([URL isEqualToString:URLString]) {
        return YES;
    }
    
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    
    NSDictionary *opening_hours = @{ @"monday": @"0900-1800",
                                     @"tuesday": @"0900-1800",
                                     @"wednesday": @"0900-1800",
                                     @"thursday": @"0900-2100",
                                     @"friday": @"0900-1800",
                                     @"saturday": @"1000-1700",
                                     @"sunday": @"closed",
                                     };
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:opening_hours
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:NULL];
    
    NSDictionary *headers = @{ @"Content-Type": @"application/json" };
    
    NSURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:URLString]
                                                          statusCode:200
                                                         HTTPVersion:@"HTTP/1.1"
                                                        headerFields:headers];
    
    // Create NSData object containing JSON
    
    [self.client URLProtocol:self
          didReceiveResponse:response
          cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    
    [self.client URLProtocol:self
                 didLoadData:jsonData];
    
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)stopLoading {
    // No point cancelling the hardcoded response
}

@end
