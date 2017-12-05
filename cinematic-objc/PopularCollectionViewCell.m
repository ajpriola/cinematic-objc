//
//  PopularCollectionViewCell.m
//  cinematic-objc
//
//  Created by AJ Priola on 11/30/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "PopularCollectionViewCell.h"
#import "Movie.h"

@implementation PopularCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.posterImageView.layer setCornerRadius:2.0];
    [self.posterImageView setClipsToBounds:true];
}

- (void)setMovie:(Movie *)movie {
    if (movie != _movie) {
        _movie = movie;
        [self.posterImageView setImage:nil];
        
        [self.movie getLargeImageWithCompletion:^(NSError *error, UIImage *image) {
            if (image) {
                [self.posterImageView setImage:image];
            }
        }];
    }
}

@end
