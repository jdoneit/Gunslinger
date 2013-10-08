//
//  GlViewController.h
//  Glued
//
//  Created by Bernhard Mies on 11.08.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#import <Hydra/GLView.h>

@interface GLViewController : UIViewController
{
    GLView* glView;
    CGRect  _frame;
    BOOL    _retina;
    BOOL    _iPad;
    BOOL    _widescreen;
    BOOL    _firstViewLayout;
    
    UIWindow* _parent;
}

@property(nonatomic, retain) GLView *glView;

- (id)initForGlView:(CGRect)frame realSize:(CGSize)realSize useFactory:(void*)factory window:(UIWindow*)parent;
- (UIViewController*)glViewCtrl;

@end
