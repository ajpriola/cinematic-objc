//
//  MovieDetailTableViewController.m
//  cinematic-objc
//
//  Created by AJ Priola on 11/30/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "MovieDetailTableViewController.h"

@interface MovieDetailTableViewController ()

@end

@implementation MovieDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.tableView setEstimatedRowHeight:130.0];
    
    [self.posterImageView.layer setCornerRadius:2.0];
    [self.posterImageView setClipsToBounds:true];
    
    if (self.movie) {
        
        [self.titleLabel setText:self.movie.title];
        NSInteger year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:self.movie.releaseDate];
        [self.yearLabel setText:[NSString stringWithFormat:@"%ld", year]];
        [self.overviewLabel setText:self.movie.overview];
        [self.reviewDetailLabel setText:[NSString stringWithFormat:@"See what everyone thinks of %@", self.movie.title]];
        [self.movie getLargeImageWithCompletion:^(NSError *error, UIImage *image) {
            if (image) {
                [self.posterImageView setImage:image];
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setMovie:(Movie *)movie {
    if (movie != _movie) {
        _movie = movie;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


@end
