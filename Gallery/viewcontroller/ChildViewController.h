//
//  ChildViewController.h
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicViewController.h"

@interface ChildViewController : BasicViewController <UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGRect startRect;

@end
