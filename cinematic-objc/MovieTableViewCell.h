//
//  MovieTableViewCell.h
//  cinematic-objc
//
//  Created by AJ Priola on 11/29/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

@property (nonatomic) Movie *movie;

@end
