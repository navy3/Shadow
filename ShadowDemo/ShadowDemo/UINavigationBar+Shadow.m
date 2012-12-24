//
//  UINavigationBar+Shadow.m
//  NavigationBarWithShadowDemo
//
//  Created by navy on 12-12-24.
//  Copyright (c) 2012年 lostinmalmo.com. All rights reserved.
//

#import "UINavigationBar+Shadow.h"
#import <QuartzCore/QuartzCore.h>

@implementation UINavigationBar (Shadow)

- (void)addShadow
{
    // draw shadow
    self.layer.masksToBounds = NO;
    //-3 up 3 down
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}

@end
