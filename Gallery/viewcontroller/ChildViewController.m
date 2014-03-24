//
//  ChildViewController.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "ChildViewController.h"
#import "GalleryCell.h"

@interface ChildViewController () {
    UIView *_whiteView;
    NSMutableArray *_finalPositions;
}

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
    
    self.view.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor clearColor];
    // insert view blow collectionview
    _whiteView = [[UIView alloc] initWithFrame:self.view.bounds];
    _whiteView.backgroundColor = [UIColor whiteColor];
    _whiteView.layer.opacity = 0;
    [self.view insertSubview:_whiteView belowSubview:self.collectionView];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchRecognizer.delegate = self;
    [self.view addGestureRecognizer:pinchRecognizer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self expandAllCells];
}

- (void)expandAllCells
{
    NSLog(@"expandAllCells");
    _finalPositions = [[NSMutableArray alloc] init];
    for (GalleryCell *cell in self.collectionView.visibleCells) {
        NSValue *rectValue = [NSValue valueWithCGRect:cell.frame];
        [_finalPositions addObject:rectValue];
        cell.frame = self.startRect;
    }
    [UIView animateWithDuration:0.3 animations:^{
        // opcity of background
        _whiteView.layer.opacity = 1;
        // all position of cells
        for (int i=0; i<[self.collectionView.visibleCells count]; i++) {
            GalleryCell *cell = [self.collectionView.visibleCells objectAtIndex:i];
            cell.transform = CGAffineTransformIdentity;
            cell.frame = [[_finalPositions objectAtIndex:i] CGRectValue];
        }
    }];
}

- (void)transformAllCells:(CGFloat)scale
{
    // opcity of background
    _whiteView.layer.opacity = scale;

    // all scale of cells
    CGFloat rangedScale = scale > 1 ? 1 : scale;
    rangedScale = rangedScale < 0.7 ? 0.7 : rangedScale;
    for (int i=0; i<[self.collectionView.visibleCells count]; i++) {
        GalleryCell *cell = [self.collectionView.visibleCells objectAtIndex:i];

        // scale & rotate
        cell.transform = CGAffineTransformIdentity; // reset
        if (cell.frame.origin.x == self.startRect.origin.x
            && cell.frame.origin.y == self.startRect.origin.y) {
            [self.collectionView bringSubviewToFront:cell];
        } else {
            CGAffineTransform scaleTransform = CGAffineTransformScale(cell.transform, rangedScale, rangedScale);
            CGAffineTransform rotateTransform = CGAffineTransformRotate(cell.transform, i * M_PI_4 * (1 - rangedScale) * (i % 2 == 0 ? 1 : -1));
            cell.transform = CGAffineTransformConcat(scaleTransform, rotateTransform);
        }
        
        // move position
        CGRect finalRect = [[_finalPositions objectAtIndex:i] CGRectValue];
        cell.center = CGPointMake(finalRect.size.width / 2 + finalRect.origin.x,
                                  finalRect.size.height / 2 + finalRect.origin.y);  // reset
        CGPoint startCenter = CGPointMake(self.startRect.size.width / 2 + self.startRect.origin.x,
                                          self.startRect.size.height / 2 + self.startRect.origin.y);
        cell.center = CGPointMake((startCenter.x - cell.center.x) * (1 - rangedScale) + cell.center.x,
                                  (startCenter.y - cell.center.y) * (1 - rangedScale) + cell.center.y);
    }
}

- (void)unfoldAllCells
{
    [UIView animateWithDuration:0.3 animations:^{
        // opcity of background
        _whiteView.layer.opacity = 0;
        // all position of cells
        CGRect convertedStartRect = CGRectMake(self.startRect.origin.x,
                                               self.startRect.origin.y + self.collectionView.contentOffset.y,
                                               self.startRect.size.width,
                                               self.startRect.size.height);
        for (GalleryCell *cell in self.collectionView.visibleCells) {
            cell.transform = CGAffineTransformIdentity;
            cell.frame = convertedStartRect;
        }
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    
//    self.view.backgroundColor.

    if (recognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"gesture ended");
        [self unfoldAllCells];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"gesture changed %f", recognizer.scale);
        [self transformAllCells:recognizer.scale];
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
