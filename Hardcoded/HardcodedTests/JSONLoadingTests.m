//
//  JSONLoadingTests.m
//  Unit Tests Tests
//
//  Created by Matthew Robinson on 15/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BLCMockJSONProtocol.h"

@interface JSONLoadingTests : XCTestCase

@end

@implementation JSONLoadingTests

- (void)setUp {
    [super setUp];
    
    [NSURLProtocol registerClass:[BLCMockJSONProtocol class]];
}

- (void)tearDown
{
    [NSURLProtocol unregisterClass:[BLCMockJSONProtocol class]];
    
    [super tearDown];
}

- (void)test_requestJSONData {
    
    NSURL *jsonURL = [NSURL URLWithString:@"http://example.com/data.json"];
    
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL:jsonURL];

    XCTAssertNotNil(jsonData, @"Raw jsonData returned should not be nil");
    
    NSDictionary *opening_hours = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    XCTAssertNotNil(opening_hours, @"Deserialised opening hours should not be nil");
    
    NSLog(@"%@", opening_hours[@"sunday"]);
    
    XCTAssert([opening_hours[@"sunday"] isEqualToString:@"closed"], "Sunday should be closed");
}

@end
