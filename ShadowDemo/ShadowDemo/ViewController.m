//
//  ViewController.m
//  ShadowDemo
//
//  Created by navy on 12-12-24.
//  Copyright (c) 2012年 navy. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Shadow.h"


@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Shadow View";
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 200.0)];
        view.center = self.view.center;
        view.backgroundColor = [UIColor redColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;

        [view addShadow];
        [self.view addSubview:view];
        
        //Create a couple of colours for the background gradient
        UIColor *colorOne = [UIColor whiteColor];
        UIColor *colorTwo = [UIColor blackColor];
        
        //Create the gradient and add it to our view's root layer
        CAGradientLayer *gradientLayer = [[[CAGradientLayer alloc] init] autorelease];
        gradientLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [gradientLayer setColors:[NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil]];
        //[self.view.layer insertSublayer:gradientLayer atIndex:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
