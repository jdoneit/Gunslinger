//
//  AppDelegate.m
//  Roland
//
//  Created by Bernhard Mies on 05.11.12.
//  Copyright (c) 2012 Woodland Barbarians. All rights reserved.
//

#import "AppDelegate.h"
#import <Hydra/GLView.h>
#import "ClassFactory.h"
//#import "Flurry.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [TestFlight takeOff:@"301157dbe9339bbc7dbcf03583e7a5f4_NDIwMzEyMDEyLTAxLTA0IDAzOjI1OjQ2LjA5ODA2NA"];

    //[Flurry startSession:@"8GBR8SK97H5MMX6FZ4HT"];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    CGSize realSize = CGSizeMake(320, 480);
    float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
    // You can't detect screen resolutions in pre 3.2 devices, but they are all 320x480
    if (ver >= 3.2f)
    {
        UIScreen* mainscr = [UIScreen mainScreen];
        realSize.width = mainscr.currentMode.size.width;
        realSize.height = mainscr.currentMode.size.height;
    }
    
    m_window = [[UIWindow alloc] initWithFrame: screenBounds];
    
    ClassFactory* gcf = new ClassFactory();

    self.viewController = [[GLViewController alloc] initForGlView:screenBounds realSize:realSize useFactory:gcf window:m_window];
    
    m_window.rootViewController = self.viewController;
    [m_window makeKeyAndVisible];
    
    return YES;
}

- (void) dealloc
{
    [self.viewController.glView release];
    [self.viewController release];
    [m_window release];
    [super dealloc];
    
}

- (void) applicationWillResignActive:(UIApplication *)application
{
    [self.viewController.glView applicationWillResignActive:application];
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
    [self.viewController.glView applicationDidBecomeActive:application];
}

- (void) applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [self.viewController.glView applicationDidReceiveMemoryWarning:application];
}

- (void) applicationWillTerminate:(UIApplication *)application
{
    [self.viewController.glView applicationWillTerminate:application];
}

@end