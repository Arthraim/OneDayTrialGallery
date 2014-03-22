//
//  BasicViewController.h
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChildViewController;

@interface BasicViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, strong) ChildViewController *childViewController;

- (id)initImageUrls:(NSArray *)urls;

@end
