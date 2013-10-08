//
//  AppDelegate.h
//  Roland
//
//  Created by Bernhard Mies on 05.11.12.
//  Copyright (c) 2012 Woodland Barbarians. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlViewController.h"

@class GLView;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow* m_window;
//    GLView* m_view;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GLViewController *viewController;

@end
