//
//  MovieTableViewCell.m
//  cinematic-objc
//
//  Created by AJ Priola on 11/29/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.posterImageView.layer setCornerRadius:2.0];
    [self.posterImageView setClipsToBounds:true];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setMovie:(Movie *)movie {
    if (movie != _movie) {
        _movie = movie;
        [self.posterImageView setImage:nil];
    }
    
    [self.titleLabel setText:movie.title];
    
    NSInteger year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:movie.releaseDate];
    [self.yearLabel setText:[NSString stringWithFormat:@"%ld", year]];
    
    [self.movie getImageWithCompletion:^(NSError *error, UIImage *image) {
        if (image) {
            [self.posterImageView setImage:image];
        }
    }];
}

@end
