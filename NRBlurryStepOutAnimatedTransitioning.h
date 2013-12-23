//
//  ZoomAnimationController.h
//
//  Created by Takuya Matsuyama on 22/12/2013.
//  Copyright (c) 2013 Takuya Matsuyama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRBlurryStepOutAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

- (id) initWithPresenting: (BOOL)presenting;
- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

@property (nonatomic, assign) NSTimeInterval presentationDuration;
@property (nonatomic, assign) NSTimeInterval dismissalDuration;
@property (nonatomic, assign) BOOL isPresenting;

@end
