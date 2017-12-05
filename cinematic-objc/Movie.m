//
//  Movie.m
//  cinematic-objc
//
//  Created by AJ Priola on 11/29/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "Movie.h"
#import <AFNetworking.h>
#import <AFNetworking/AFImageDownloader.h>

@implementation Movie

static NSString * const kSearchEndpoint = @"https://api.themoviedb.org/3/search/movie";
static NSString * const kImageEndpoint = @"https://image.tmdb.org/t/p/";
static NSString * const kPopularEndpoint = @"https://api.themoviedb.org/3/movie/popular";

- (id)initWithJSON:(NSDictionary*)json {
    if (self == [super init]) {
        self.uid = [json objectForKey:@"id"];
        self.title = [json objectForKey:@"title"];
        self.posterPath = [json objectForKey:@"poster_path"];
        self.overview = [json objectForKey:@"overview"];
        
        NSString *dateString = [json objectForKey:@"release_date"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        self.releaseDate = [formatter dateFromString:dateString];
    }
    
    return self;
}

- (void)getSmallImageWithCompletion:(void (^)(NSError *error, UIImage *image))completion {
    NSString *url = [NSString stringWithFormat:@"%@w92%@", kImageEndpoint, self.posterPath];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:url]];
    [[AFImageDownloader defaultInstance] downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        completion(nil, responseObject);
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        completion(error, nil);
    }];
}

- (void)getLargeImageWithCompletion:(void (^)(NSError *error, UIImage *image))completion {
    NSString *url = [NSString stringWithFormat:@"%@w500%@", kImageEndpoint, self.posterPath];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:url]];
    [[AFImageDownloader defaultInstance] downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        completion(nil, responseObject);
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        completion(error, nil);
    }];
}

+ (void)search:(NSString*)query completion:(void (^)(NSError *error, NSArray *results))completion {
    NSString *key = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"API Key"];
    if (key) {
        NSDictionary *parameters = @{@"api_key" : key, @"query" : query};
        [[AFHTTPSessionManager manager] POST:kSearchEndpoint parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSMutableArray *movies = [[NSMutableArray alloc] init];
                for (NSDictionary *json in [responseObject objectForKey:@"results"]) {
                    [movies addObject:[[Movie alloc] initWithJSON:json]];
                }
                completion(nil, movies);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(error, nil);
        }];
    } else {
        NSLog(@"No API Key found");
    }
}

+ (void)getPopularMoviesWithCompletion:(void (^)(NSError *, NSArray *))completion {
    NSString *key = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"API Key"];
    if (key) {
        NSDictionary *parameters = @{@"api_key" : key};
        [[AFHTTPSessionManager manager] POST:kPopularEndpoint parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSMutableArray *movies = [[NSMutableArray alloc] init];
                for (NSDictionary *json in [responseObject objectForKey:@"results"]) {
                    [movies addObject:[[Movie alloc] initWithJSON:json]];
                }
                completion(nil, movies);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(error, nil);
        }];
    }
}

@end
