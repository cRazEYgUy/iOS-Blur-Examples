//
//  FJDetailViewController.m
//  BlurExample
//
//  Created by Engin Kurutepe on 01/04/14.
//  Copyright (c) 2014 Fifteen Jugglers Software. All rights reserved.
//

#import "FJStaticBlurViewController.h"
#import "FJFrostedGlassView.h"

@interface FJStaticBlurViewController ()

@property (nonatomic, strong) FJFrostedGlassView *smallView;

@end

@implementation FJStaticBlurViewController

#pragma mark - Managing the detail item


- (void)viewDidLoad
{
    [super viewDidLoad];
    _smallView = [[FJFrostedGlassView alloc] initWithFrame:CGRectMake(300, 400, 300, 300)];
    _smallView.contentMode = UIViewContentModeCenter;
    _smallView.clipsToBounds = YES;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view addSubview:_smallView];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
