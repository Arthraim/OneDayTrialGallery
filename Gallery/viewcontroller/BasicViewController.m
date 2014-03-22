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

#define CELL_REUSE_IDENTIFIER @"GalleryCellIdentifier"

@interface BasicViewController () {
    GalleryCollectionViewLayout *_collectionViewLayout;
    UICollectionView *_collectionView;
    
    NSMutableArray *_images;
}


@end

@implementation BasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _images = [@[@"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/dnb4n65vl24is9mquuel.jpg",
                     @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/vvhnfiyxbbtqtv484gl8.jpg",
                     @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/wtosd6admrx49nfufwwb.jpg",
                     @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/n8kbuv7dhzrmiziyeell.jpg",
                     @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/o8vgy3pehjgzhrlevpka.jpg",
                     @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/zgto3l3fwxro668ctxgl.jpg",
                     @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/pqraq6r7dsvh8jmzwr1y.jpg",
                     @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/wgupvl6vubdr9bhidpej.jpg"]
                   mutableCopy];
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



@end
