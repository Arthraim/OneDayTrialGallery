//
//  ChildViewController.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "ChildViewController.h"
#import "GalleryCell.h"

@implementation ChildViewController

- (id)initImageUrls:(NSArray *)urls
{
    self = [super initImageUrls:urls];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *imageUrl = [self.images objectAtIndex:indexPath.row];
    NSLog(@"%@", imageUrl);
    
    GalleryCell *cell = (GalleryCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);

    [UIView animateWithDuration:0.2 animations:^{
        cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 animations:^{
            cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15 animations:^{
                cell.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
}

@end
