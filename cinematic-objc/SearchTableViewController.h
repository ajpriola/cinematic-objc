//
//  SearchTableViewController.h
//  cinematic-objc
//
//  Created by AJ Priola on 11/29/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic) NSArray *results;

@end
