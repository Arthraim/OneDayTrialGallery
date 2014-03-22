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
        
        CGRect imageViewFrame = CGRectMake(IMAGE_VIEW_MARGIN,
                                           IMAGE_VIEW_MARGIN,
                                           frame.size.width-IMAGE_VIEW_MARGIN*2,
                                           frame.size.height-IMAGE_VIEW_MARGIN*2);
        
        self.imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
        self.imageView.layer.shadowOffset = CGSizeMake(1, 1);
//        self.imageView.clipsToBounds = YES;
        
        [self addSubview:self.imageView];
        
    }
    return self;
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
