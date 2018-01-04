//
//  ReviewTableViewCell.h
//  cinematic-objc
//
//  Created by AJ Priola on 12/5/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Review.h"

@interface ReviewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic) Review *review;

@end
