//
//  AppDelegate.m
//  Gallery
//
//  Created by Wang Xuyang on 3/22/14.
//  Copyright (c) 2014 Wang Xuyang. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSArray *images = @[@"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/dnb4n65vl24is9mquuel.jpg",
                        @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/vvhnfiyxbbtqtv484gl8.jpg",
                        @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/wtosd6admrx49nfufwwb.jpg",
                        @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/n8kbuv7dhzrmiziyeell.jpg",
                        @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/o8vgy3pehjgzhrlevpka.jpg",
                        @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/zgto3l3fwxro668ctxgl.jpg",
                        @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/pqraq6r7dsvh8jmzwr1y.jpg",
                        @"http://res.cloudinary.com/hrscywv4p/image/upload/c_thumb,h_300,w_300/wgupvl6vubdr9bhidpej.jpg"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.basicViewController = [[BasicViewController alloc] initImageUrls:images];
    self.window.rootViewController = self.basicViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
