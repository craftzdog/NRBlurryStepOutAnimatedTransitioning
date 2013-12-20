//
//  NRPresentedViewController.m
//  BlurredStepOutModalSample
//
//  Created by nora on 12/20/13.
//  Copyright (c) 2013 PuKaPuKa. All rights reserved.
//

#import "NRPresentedViewController.h"
#import "NRModalViewController.h"
#import "NRBlurryStepOutAnimatedTransitioning.h"

@interface NRPresentedViewController ()

@end

@implementation NRPresentedViewController

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

    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Image"]];

    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(40, 500, 240, 44);
    self.button.backgroundColor = [UIColor whiteColor];
    [self.button setTitle:@"Show" forState:UIControlStateNormal];
    [self.button addTarget:self
                    action:@selector(showNewController:)
          forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showNewController:(id)sender;
{
    UIViewController* vc = [[NRModalViewController alloc] init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:NULL];
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [[NRBlurryStepOutAnimatedTransitioning alloc] initWithPresenting:YES];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[NRBlurryStepOutAnimatedTransitioning alloc] initWithPresenting:NO];
}


@end
