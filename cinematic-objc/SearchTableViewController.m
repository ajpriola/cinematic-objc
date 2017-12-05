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
#import "MovieDetailTableViewController.h"

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
    
    if (self.results.count < 1) {
        CGRect labelFrame = CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
        UILabel *emptyLabel = [[UILabel alloc] initWithFrame:labelFrame];
        
        [emptyLabel setText:@"Search for a movie!"];
        [emptyLabel setTextAlignment:NSTextAlignmentCenter];
        [emptyLabel sizeToFit];
        
        [self.tableView setBackgroundView:emptyLabel];
    } else {
        [self.tableView setBackgroundView:nil];
    }
    
    return self.results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMovieCellReuseIdentifier forIndexPath:indexPath];
    [cell setMovie:[self.results objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue destinationViewController] isKindOfClass:[MovieDetailTableViewController class]]) {
        MovieDetailTableViewController *destination = [segue destinationViewController];
        Movie *selectedMovie = [_results objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        if (selectedMovie) {
            [destination setMovie:selectedMovie];
        }
    }
}

@end
