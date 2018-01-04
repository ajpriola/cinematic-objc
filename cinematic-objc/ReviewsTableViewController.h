//
//  ReviewsTableViewController.h
//  cinematic-objc
//
//  Created by AJ Priola on 12/5/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface ReviewsTableViewController : UITableViewController

@property (nonatomic) Movie *movie;
@property (nonatomic) NSArray *reviews;

@end
