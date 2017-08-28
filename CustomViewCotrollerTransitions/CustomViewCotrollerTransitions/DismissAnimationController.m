//
//  DismissAnimationController.m
//  CustomViewCotrollerTransitions
//
//  Created by WorkStation on 8/27/17.
//  Copyright © 2017 WorkStation. All rights reserved.
//

#import "DismissAnimationController.h"

@implementation DismissAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 2.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [transitionContext.containerView addSubview:fromView];
    [transitionContext.containerView addSubview:toView];
}

@end
