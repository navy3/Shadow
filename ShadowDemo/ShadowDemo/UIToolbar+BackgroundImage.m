//
//  UIToolbar.m
//  PhotoShare
//
//  Created by  on 12-7-13.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "UIToolbar+BackgroundImage.h"

@implementation UIToolbar (BackgroundImage)

- (void)drawRect:(CGRect)rect 
{
    UIImage *image = [UIImage imageNamed: @"toolbar-bg.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self setTintColor:nil];
}

+ (void) iOS5UIToolbarBackgroundImage
{
    if ([UIToolbar respondsToSelector: @selector(appearance)])
    {
        [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed: @"toolbar-bg.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        [[UIToolbar appearance] setTintColor:nil];
    }
}

@end

