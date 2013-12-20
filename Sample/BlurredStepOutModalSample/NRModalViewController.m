//
//  NRModalViewController.m
//  BlurredStepOutModalSample
//
//  Created by nora on 12/20/13.
//  Copyright (c) 2013 PuKaPuKa. All rights reserved.
//

#import "NRModalViewController.h"

@interface NRModalViewController ()

@end

@implementation NRModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(40, 500, 240, 44);
    self.button.backgroundColor = [UIColor blueColor];
    [self.button setTitle:@"Hide" forState:UIControlStateNormal];
    [self.button addTarget:self
                    action:@selector(buttonDidClick:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    
    UILabel* textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 280, 300)];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.numberOfLines = 30;
    textLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];

    [self.view addSubview:textLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) buttonDidClick:(id)sender;
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
