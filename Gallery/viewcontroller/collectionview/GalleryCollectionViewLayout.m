//
//  GalleryCollectionViewLayout.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "GalleryCollectionViewLayout.h"

#define COLLUMN_NUMMBER 2
#define WIDTH 160
#define HEIGHT 160

@interface GalleryCollectionViewLayout () {
    NSMutableArray * _attributesArray;
    CGSize _contentSize;
}

@end

@implementation GalleryCollectionViewLayout

-(void)prepareLayout
{
    _attributesArray = [[NSMutableArray alloc] init];

    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    _contentSize = CGSizeMake(320, count / COLLUMN_NUMMBER * HEIGHT);
    
    for (NSInteger i=0; i < count; i++) {
        
        NSInteger row = i / COLLUMN_NUMMBER;
        NSInteger collumn = i % COLLUMN_NUMMBER;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectIntegral(CGRectMake(collumn*WIDTH, row*HEIGHT, WIDTH, HEIGHT));
        NSLog(@"%d %d %@", row, collumn, attributes);
        [_attributesArray addObject:attributes];
    }
}

- (CGSize)collectionViewContentSize
{
    return _contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_attributesArray objectAtIndex:indexPath.row];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
//    return [_attributesArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
//        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
//    }]];
    return _attributesArray;
}

@end
