//
//  AnimatedViewController.m
//  CustomViewControllerTransitions
//
//  Created by WorkStation on 8/27/17.
//  Copyright © 2017 WorkStation. All rights reserved.
//

#import "CustomAnimationController.h"
#import "DismissAnimator.h"
#import "PresentAnimator.h"

@interface CustomAnimationController ()<UIViewControllerTransitioningDelegate>

@end

@implementation CustomAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
}

- (IBAction)dismissButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate protocol methods

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [PresentAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [DismissAnimator new];
}

@end
