//
//  PopularCollectionViewController.m
//  cinematic-objc
//
//  Created by AJ Priola on 11/30/17.
//  Copyright © 2017 AJ Priola. All rights reserved.
//

#import "PopularCollectionViewController.h"
#import "PopularCollectionViewCell.h"
#import "MovieDetailTableViewController.h"

@interface PopularCollectionViewController ()

@end

@implementation PopularCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat cellWidth = ([UIScreen mainScreen].bounds.size.width - 6.0) / 2.0;
    CGFloat cellHeight = cellWidth * (1.48);
    CGSize itemSize = CGSizeMake(cellWidth, cellHeight);
    [layout setItemSize:itemSize];
    [layout setMinimumInteritemSpacing:2.0];
    [layout setMinimumLineSpacing:2.0];
    UIEdgeInsets collectionViewInsets = UIEdgeInsetsMake(2.0, 2.0, 2.0, 2.0);
    [self.collectionView setContentInset:collectionViewInsets];
    
    // Do any additional setup after loading the view.
    
    [Movie getPopularMoviesWithCompletion:^(NSError *error, NSArray *results) {
        if (error) {
            
        } else {
            [self setPopularMovies:results];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPopularMovies:(NSArray *)popularMovies {
    if (popularMovies != _popularMovies) {
        _popularMovies = popularMovies;
        
        [self.collectionView reloadData];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue destinationViewController] isKindOfClass:[MovieDetailTableViewController class]]) {
        MovieDetailTableViewController *destination = [segue destinationViewController];
        Movie *selectedMovie = [_popularMovies objectAtIndex:[self.collectionView indexPathsForSelectedItems].firstObject.row];
        if (selectedMovie) {
            [destination setMovie:selectedMovie];
        }
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _popularMovies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PopularCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    Movie *movie = [_popularMovies objectAtIndex:indexPath.row];
    [cell setMovie:movie];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
