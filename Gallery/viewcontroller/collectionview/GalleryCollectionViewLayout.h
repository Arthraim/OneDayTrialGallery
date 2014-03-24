//
//  GalleryCollectionViewLayout.h
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) CGFloat columnNumber;
@property (nonatomic, assign) CGFloat width; // imageview width
@property (nonatomic, assign) CGFloat height; // imageview height
@property (nonatomic, assign) CGFloat margin;

- (instancetype)initWithColumnNumber:(CGFloat)columnNumber width:(CGFloat)width height:(CGFloat)height;

@end
