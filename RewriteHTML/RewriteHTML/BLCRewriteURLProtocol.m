//
//  BLCRewriteURLProtocol.m
//  RewriteHTML
//
//  Created by Matthew Robinson on 15/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import "BLCRewriteURLProtocol.h"

@interface BLCRewriteURLProtocol () <NSURLConnectionDataDelegate>

@property (strong,nonatomic) NSURLConnection *connection;
@property (strong,nonatomic) NSMutableData *data;
@property (strong,nonatomic) NSString *MIMEType;

@end

@implementation BLCRewriteURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    if ([NSURLProtocol propertyForKey:NSStringFromClass([self class])
                            inRequest:request]) {
        return NO;
    }
    
    return YES;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    NSMutableURLRequest *newRequest = [self.request mutableCopy];
    
    [NSURLProtocol setProperty:@YES
                        forKey:NSStringFromClass([self class])
                     inRequest:newRequest];
    
    self.connection = [NSURLConnection connectionWithRequest:newRequest
                                                    delegate:self];
    
    [self.connection start];
}

- (void)stopLoading {
    [self.connection cancel];
    self.connection = nil;
}

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {

    self.data = [NSMutableData data];
    
    self.MIMEType = [response MIMEType];
    
    [self.client URLProtocol:self
          didReceiveResponse:response
          cacheStoragePolicy:NSURLCacheStorageNotAllowed];
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if ([self.MIMEType isEqualToString:@"text/html"]) {
        NSString *html = [[NSString alloc] initWithData:self.data
                                               encoding:NSUTF8StringEncoding];
        
        NSString *modifiedHTML = [html stringByReplacingOccurrencesOfString:@"Apple"
                                                                 withString:@"Fruit"];
        
        NSData *modifiedData = [modifiedHTML dataUsingEncoding:NSUTF8StringEncoding];
        
        [self.client URLProtocol:self
                     didLoadData:modifiedData];
        
    } else {
        [self.client URLProtocol:self
                     didLoadData:self.data];
    }
    
    [self.client URLProtocolDidFinishLoading:self];
    
    self.connection = nil;
    self.data = nil;
    self.MIMEType = nil;
}

@end
