//
//  Movie.h
//  cinematic-objc
//
//  Created by AJ Priola on 11/29/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@interface Movie : NSObject

@property (strong) NSNumber *uid;
@property (strong) NSString *title;
@property (strong) NSString *posterPath;
@property (strong) NSDate *releaseDate;

- (id)initWithJSON:(NSDictionary*)json;
- (void)getImageWithCompletion:(void (^)(NSError *error, UIImage *image))completion;

+ (void)search:(NSString*)query completion:(void (^)(NSError *error, NSArray *results))completion;

@end
