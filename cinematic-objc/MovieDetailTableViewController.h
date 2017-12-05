//
//  MovieDetailTableViewController.h
//  cinematic-objc
//
//  Created by AJ Priola on 11/30/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewDetailLabel;

@property (nonatomic) Movie *movie;

@end
