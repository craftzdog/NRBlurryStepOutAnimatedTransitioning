NRBlurryStepOutAnimatedTransitioning
====================================

A tweetbot for iOS7 like modal view transitioning.
This module is a animated transitioning class which applies blur effect to step-backed view while modal view is presenting.

[Demo video](http://www.youtube.com/watch?v=DBhdKHwaGyw)

![Screenshot01](./Sample/screenshot1.png)
![Screenshot02](./Sample/screenshot2.png)

## How to use

Add `NRBlurryStepOutAnimatedTransitioning.h,m` to your project.

In your header:

    @interface NRPresentedViewController : UIViewController<UIViewControllerTransitioningDelegate>
    @end

In your source:

    #import "NRBlurryStepOutAnimatedTransitioning.h"

    -(void)showNewController;
    {
        UIViewController* vc = [[YourModalViewController alloc] init];
        vc.transitioningDelegate = self;
        [self presentViewController:vc animated:YES completion:NULL];
    }
    
    
    #pragma mark - UIViewControllerTransitioningDelegate
    
    - (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
    {
        return [[NRBlurryStepOutAnimatedTransitioning alloc] initWithPresenting:YES];
    }
    
    - (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
    {
        return [[NRBlurryStepOutAnimatedTransitioning alloc] initWithPresenting:NO];
    }

Invoke `-showNewController` from somewhere you like.
That's it :)


