//
//  PopularCollectionViewCell.h
//  cinematic-objc
//
//  Created by AJ Priola on 11/30/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface PopularCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@property (nonatomic) Movie *movie;

@end
