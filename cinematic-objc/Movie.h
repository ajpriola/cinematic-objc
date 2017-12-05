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

@property NSNumber *uid;
@property NSString *title;
@property NSString *posterPath;
@property NSDate *releaseDate;
@property NSString *overview;

- (id)initWithJSON:(NSDictionary*)json;
- (void)getSmallImageWithCompletion:(void (^)(NSError *error, UIImage *image))completion;
- (void)getLargeImageWithCompletion:(void (^)(NSError *error, UIImage *image))completion;

+ (void)search:(NSString*)query completion:(void (^)(NSError *error, NSArray *results))completion;
+ (void)getPopularMoviesWithCompletion:(void (^)(NSError *error, NSArray *results))completion;

@end
