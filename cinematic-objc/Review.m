//
//  Review.m
//  cinematic-objc
//
//  Created by AJ Priola on 12/5/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "Review.h"

@implementation Review

- (id)initWithJSON:(NSDictionary*)json {
    if (self == [super init]) {
        self.uid = [json objectForKey:@"id"];
        self.author = [json objectForKey:@"author"];
        self.content = [json objectForKey:@"content"];
        self.url = [[NSURL alloc] initWithString:[json objectForKey:@"url"]];
    }
    
    return self;
}

@end
