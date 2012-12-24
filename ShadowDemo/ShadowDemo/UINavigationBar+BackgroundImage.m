//
//  UINavigationBar.m
//  PhotoShare
//
//  Created by  on 12-7-13.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "UINavigationBar+BackgroundImage.h"

@implementation UINavigationBar (BackgroundImage)

- (void)drawRect:(CGRect)rect 
{    
    UIImage* img = [UIImage imageNamed: @"navigationBarBackgroundRetro.png"];
    [img drawInRect: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];  
    [self setTintColor:nil];      
}

+ (void)iOS5UINavigationBarBackgroundImage
{
    if ([UINavigationBar respondsToSelector: @selector(appearance)])
    {        
        [[UINavigationBar appearance] setBackgroundImage: [UIImage imageNamed: @"navigationBarBackgroundRetro.png"] forBarMetrics: UIBarMetricsDefault];
        [[UINavigationBar appearance] setTintColor:nil];
    }
}

@end
