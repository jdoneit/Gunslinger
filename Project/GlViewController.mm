//
//  GlViewController.cpp
//  Glued
//
//  Created by Bernhard Mies on 11.08.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#include "GlViewController.h"

@implementation GLViewController

@synthesize glView;

- (id)initForGlView:(CGRect)frame realSize:(CGSize)realSize useFactory:(void*)factory window:(UIWindow*)parent
{
    if (self = [super init]) {
        self.view = [[UIView alloc] initWithFrame:frame];
        self.view.backgroundColor = [UIColor redColor];
        
        self.glView = [[GLView alloc] initWithFrame:frame realSize:realSize useFactory:factory viewCtrl:self];
        self.view = self.glView;
        
    }
    
    return self;
}

- (void) didRotate: (NSNotification*) notification
{
}

- (void)loadView
{
    [super loadView];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotate {
    return YES;
}

//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
//    NSLog(@"ROTATING TO %d", toInterfaceOrientation);
////[banner setTransform:CGAffineTransformIdentity];
//}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

// pre-iOS 6 support
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    bool fuck = (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
                 toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
    return fuck;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
}

-(void) pauseDrawing
{
}

-(void) restartDrawing
{
}


- (void)openUrl:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: url]];
}


- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIViewController*)glViewCtrl {
    return self;
}

@end
