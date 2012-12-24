//
//  UIView+Shadow.m
//  ShadowDemo
//
//  Created by navy on 12-12-24.
//  Copyright (c) 2012年 navy. All rights reserved.
//

#import "UIView+Shadow.h"
#import "UIBezierPath+ShadowPath.h"


@implementation UIView (Shadow)

- (void)addShadow
{
    self.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    self.layer.borderWidth = 5.0;
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowOpacity = 0.7;
    self.layer.shouldRasterize = YES;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCurvedShadowForRect:self.bounds];
    self.layer.shadowPath = path.CGPath;
}

@end
