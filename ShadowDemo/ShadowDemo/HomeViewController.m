//
//  HomeViewController.m
//  ShadowDemo
//
//  Created by navy on 12-12-24.
//  Copyright (c) 2012年 navy. All rights reserved.
//

#import "HomeViewController.h"
#import "UIToolbar+Shadow.h"
#import "UINavigationBar+Shadow.h"
#import "TableViewController.h"
#import "ViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Shadow Demo";
    }
    return self;
}

- (void)createToolBar
{
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 88, self.view.bounds.size.width, 44)];
    [self.view addSubview:toolbar];
    [toolbar addShadow];
    [toolbar release];
}

- (IBAction)showTableView:(id)sender
{
    TableViewController *tv = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tv animated:YES];
    [tv release];
}

- (IBAction)showView:(id)sender
{
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationBar *nb = self.navigationController.navigationBar;
    [nb addShadow];
    [self createToolBar];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
