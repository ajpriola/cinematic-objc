//
//  SearchTableViewController.m
//  cinematic-objc
//
//  Created by AJ Priola on 11/29/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "SearchTableViewController.h"
#import "Movie.h"
#import "MovieTableViewCell.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

NSString * const kMovieCellReuseIdentifier = @"movieCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setResults:(NSArray *)results {
    if (results != _results) {
        _results = results;
        [self.tableView reloadData];
    }
}

#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [Movie search:searchBar.text completion:^(NSError *error, NSArray *results) {
        [self setResults:results];
    }];
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchBar.text isEqual: @""]) {
        [self setResults:[[NSArray alloc] init]];
    }
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMovieCellReuseIdentifier forIndexPath:indexPath];
    [cell setMovie:[self.results objectAtIndex:indexPath.row]];
    return cell;
}

@end
