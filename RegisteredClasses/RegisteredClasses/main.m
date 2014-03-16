//
//  main.m
//  RegisteredClasses
//
//  Created by Matthew Robinson on 16/03/2014.
//  Copyright (c) 2014 Blended Cocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"%@", [NSURLProtocol performSelector:@selector(_registeredClasses)]);
    }
    return 0;
}

