//
//  ChildViewController.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "ChildViewController.h"
#import "GalleryCell.h"

@interface ChildViewController ()

@end

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchRecognizer.delegate = self;
    [self.view addGestureRecognizer:pinchRecognizer];
}

- (void)scaleAllCells:(CGFloat)scale
{
    scale = scale > 1 ? 1 : scale;
    scale = scale < 0.5 ? 0.5 : scale;
    for (GalleryCell *cell in self.collectionView.visibleCells) {
        cell.transform = CGAffineTransformIdentity;
        cell.transform = CGAffineTransformScale(cell.transform, scale, scale);
    }
}

- (void)resetAllCells
{
    [UIView animateWithDuration:0.3 animations:^{
        for (GalleryCell *cell in self.collectionView.visibleCells) {
            cell.transform = CGAffineTransformIdentity;
            cell.frame = self.startRect;
        }
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    
//    self.view.backgroundColor.

    if (recognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"gesture ended");
        [self resetAllCells];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"gesture changed %f", recognizer.scale);
        [self scaleAllCells:recognizer.scale];
    }
    
}

#pragma mark - cover delegate of parent class

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
