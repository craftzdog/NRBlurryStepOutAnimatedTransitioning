//
//  ZoomAnimationController.m
//
//  Created by Takuya Matsuyama on 22/12/2013.
//  Copyright (c) 2013 Takuya Matsuyama. All rights reserved.
//

#import "NRBlurryStepOutAnimatedTransitioning.h"

@interface NRBlurryStepOutAnimatedTransitioning ()

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic, strong) UIToolbar* frostedView;


@end

@implementation NRBlurryStepOutAnimatedTransitioning

-(id)init{
    self = [super init];
    
    if(self){
        
        self.presentationDuration = 0.8;
        self.dismissalDuration = 0.4;

        self.frostedView = [[UIToolbar alloc] initWithFrame:CGRectZero];
        self.frostedView.barStyle = UIBarStyleBlack;
        self.frostedView.translucent = YES;
        self.frostedView.userInteractionEnabled = NO;
        self.frostedView.alpha = 0.0f;

    }
    
    return self;
}

- (id) initWithPresenting: (BOOL)presenting;
{
    self = [self init];
    if(self) {
        self.isPresenting = presenting;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return self.isPresenting ? self.presentationDuration : self.dismissalDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
    self.transitionContext = transitionContext;
    if(self.isPresenting){
        [self executePresentationAnimation:transitionContext];
    }
    else{
     
        [self executeDismissalAnimation:transitionContext];
    }
    
}

-(void)executePresentationAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView* inView = [transitionContext containerView];

    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    toViewController.view.frame = inView.frame;
    toViewController.view.alpha = 0.0f;

    self.frostedView.alpha = 0.0f;
    self.frostedView.frame = inView.bounds;
    
    [inView insertSubview:toViewController.view
             aboveSubview:fromViewController.view];
    [inView insertSubview:self.frostedView
             aboveSubview:fromViewController.view];

    CFTimeInterval duration = self.presentationDuration;
    CFTimeInterval halfDuration = duration/2;
    
    CATransform3D t2 = [self scaleTransform];

    __block UIImage* bgImage = nil;
    
    [UIView animateKeyframesWithDuration:halfDuration delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{

        [UIView addKeyframeWithRelativeStartTime:0.0f
                                relativeDuration:0.4f
                                      animations:^{

            self.frostedView.alpha = 1.0f;
            fromViewController.view.layer.transform = t2;
        }];
        
    } completion:^(BOOL finished) {

        bgImage = [self snapshotViewAsImageForView:inView.superview];
        toViewController.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    }];

    [UIView animateWithDuration:halfDuration
                          delay:(halfDuration - (0.3*halfDuration))
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        toViewController.view.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [self.transitionContext completeTransition:YES];
    }];
}

-(void)executeDismissalAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView* inView = [transitionContext containerView];

    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    self.frostedView.alpha = 1.0f;
    self.frostedView.frame = inView.bounds;

    toViewController.view.frame = inView.frame;
    toViewController.view.layer.transform = [self scaleTransform];

    [inView insertSubview:toViewController.view
             belowSubview:fromViewController.view];
    [inView insertSubview:self.frostedView
             aboveSubview:toViewController.view];
    
    CGRect frameOffScreen = inView.frame;
    frameOffScreen.origin.y = inView.frame.size.height;
    
    NSTimeInterval duration = self.dismissalDuration;
    NSTimeInterval halfDuration = duration/2;
    
    [UIView animateKeyframesWithDuration:duration
                                   delay:0.0f
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{

        [UIView addKeyframeWithRelativeStartTime:0.f
                                relativeDuration:.4f
                                      animations:^{
            toViewController.view.layer.transform = CATransform3DIdentity;
            self.frostedView.alpha = 0.0f;
        }];
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    

    [UIView animateWithDuration:halfDuration
                     animations:^{
        fromViewController.view.alpha = 0.0f;
    } completion:^(BOOL finished) {

    }];
    

}

-(CATransform3D)scaleTransform
{
    CATransform3D t2 = CATransform3DIdentity;
    t2 = CATransform3DScale(t2, 0.9, 0.9, 1);
    
    return t2;
}

- (UIImage*) snapshotViewAsImageForView: (UIView*)view;
{
    // Want to create an image context - the size of complex view and the scale of the device screen
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    // Render our snapshot into the image context
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    
    // Grab the image from the context
    UIImage *complexViewImage = UIGraphicsGetImageFromCurrentImageContext();
    // Finish using the context
    UIGraphicsEndImageContext();
    return complexViewImage;
}


@end
