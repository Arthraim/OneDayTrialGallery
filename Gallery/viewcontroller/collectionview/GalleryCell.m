//
//  GalleryCell.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "GalleryCell.h"

#define IMAGE_VIEW_MARGIN 10

@implementation GalleryCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
        self.imageView.layer.shadowOffset = CGSizeMake(1, 1);
//        self.imageView.clipsToBounds = YES;
        
        [self addSubview:self.imageView];
        
    }
    return self;
}

- (void)updateCellWithIndexPath:(NSIndexPath *)indexPath
{
    CGRect imageViewFrame;
    if (indexPath.row % 2 == 0) {
        imageViewFrame = CGRectMake(IMAGE_VIEW_MARGIN * 4 / 3,
                                    IMAGE_VIEW_MARGIN * 4 / 3,
                                    self.frame.size.width-IMAGE_VIEW_MARGIN * 4 / 3 * 1.5,
                                    self.frame.size.height-IMAGE_VIEW_MARGIN * 4 / 3 * 1.5);
    } else {
        imageViewFrame = CGRectMake(IMAGE_VIEW_MARGIN * 4 / 3 * 0.5,
                                    IMAGE_VIEW_MARGIN * 4 / 3,
                                    self.frame.size.width-IMAGE_VIEW_MARGIN * 4 / 3 * 1.5,
                                    self.frame.size.height-IMAGE_VIEW_MARGIN * 4 / 3 * 1.5);
    }
    self.imageView.frame = imageViewFrame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
