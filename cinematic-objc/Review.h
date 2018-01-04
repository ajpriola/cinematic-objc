//
//  Review.h
//  cinematic-objc
//
//  Created by AJ Priola on 12/5/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

@property NSString *uid;
@property NSString *author;
@property NSString *content;
@property NSURL *url;

- (id)initWithJSON:(NSDictionary*)json;

@end
