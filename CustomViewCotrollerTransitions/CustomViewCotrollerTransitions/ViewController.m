//
//  ViewController.m
//  CustomViewCotrollerTransitions
//
//  Created by WorkStation on 8/27/17.
//  Copyright © 2017 WorkStation. All rights reserved.
//

#import "ViewController.h"
#import "PresentAnimationController.h"
#import "DismissAnimationController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitioningDelegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [DismissAnimationController new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [PresentAnimationController new];
}


- (IBAction)showControllerAction:(id)sender {
//    CATransition *transition = [CATransition animation];
//    transition.duration = 2.35;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = kCATransitionFade;
//    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
//    [[self navigationController] pushViewController:self.firstController animated:NO];
}

@end
