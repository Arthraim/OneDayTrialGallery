//
//  BasicViewController.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "BasicViewController.h"
#import "GalleryCollectionViewLayout.h"
#import "GalleryCell.h"
#import "ChildViewController.h"

#define CELL_REUSE_IDENTIFIER @"GalleryCellIdentifier"

@interface BasicViewController () {
    GalleryCollectionViewLayout *_collectionViewLayout;
    
    NSMutableArray *_expandingImages;
}

@end

@implementation BasicViewController

- (id)initImageUrls:(NSArray *)urls
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        self.images = [urls mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _collectionViewLayout = [[GalleryCollectionViewLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_collectionViewLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;

    [_collectionView registerClass:[GalleryCell class] forCellWithReuseIdentifier:CELL_REUSE_IDENTIFIER];

    
    [self.view addSubview:_collectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)buildChildrenImages:(NSString *)urlString
{
    _expandingImages = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        [_expandingImages addObject:urlString];
    }
    return _expandingImages;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GalleryCell *cell = (GalleryCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_REUSE_IDENTIFIER forIndexPath:indexPath];

    [cell.imageView setImageWithURL:[NSURL URLWithString:_images[indexPath.row]]];
//    cell.titleLabel.text = [NSString stringWithFormat:@"%i", indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *imageUrl = [_images objectAtIndex:indexPath.row];
    NSLog(@"%@", imageUrl);
    
    NSArray *childImages = [self buildChildrenImages:imageUrl];
    
    self.childViewController = [[ChildViewController alloc] initImageUrls:childImages];
    [self.view addSubview:self.childViewController.view];
    
}



@end
