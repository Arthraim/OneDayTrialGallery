//
//  GalleryCollectionViewLayout.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "GalleryCollectionViewLayout.h"

@interface GalleryCollectionViewLayout () {
    NSMutableArray * _attributesArray;
    CGSize _contentSize;
    
    CGFloat cellWidth;
}

@end

@implementation GalleryCollectionViewLayout

- (instancetype)initWithColumnNumber:(CGFloat)columnNumber width:(CGFloat)width height:(CGFloat)height
{
    self = [super init];
    if (self) {
        _columnNumber = columnNumber;
        _width = width;
        _height = height;
        _margin = (320 - _width * _columnNumber) / (_columnNumber + 1);
    }
    return self;
}

- (void)prepareLayout
{
    _attributesArray = [[NSMutableArray alloc] init];

    CGFloat cellWidth = 320 / _columnNumber;
    CGFloat cellHeight = _height + _margin;
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    _contentSize = CGSizeMake(320, count / _columnNumber * cellHeight + _margin);
    
    for (NSInteger i=0; i < count; i++) {
        
        NSInteger row = i / _columnNumber;
        NSInteger collumn = i % (NSInteger)_columnNumber;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectIntegral(CGRectMake(collumn*cellWidth, row*cellHeight, cellWidth, cellHeight));
//        NSLog(@"%d %d %@", row, collumn, attributes);
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
