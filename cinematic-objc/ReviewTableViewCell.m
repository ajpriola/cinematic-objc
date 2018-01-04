//
//  ReviewTableViewCell.m
//  cinematic-objc
//
//  Created by AJ Priola on 12/5/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "ReviewTableViewCell.h"

@implementation ReviewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setReview:(Review *)review {
    if (review != _review) {
        _review = review;
    }
    
    [self.authorLabel setText:_review.author];
    [self.contentLabel setText:_review.content];
}

@end
