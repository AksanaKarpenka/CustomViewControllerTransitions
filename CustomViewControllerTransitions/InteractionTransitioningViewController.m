//
//  InteractionTransitioningViewController.m
//  CustomViewControllerTransitions
//
//  Created by WorkStation on 8/27/17.
//  Copyright © 2017 WorkStation. All rights reserved.
//

#import "InteractionTransitioningViewController.h"
#import "DismissAnimator.h"

@interface InteractionTransitioningViewController ()

@end

@implementation InteractionTransitioningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    UIScreenEdgePanGestureRecognizer *edge = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromLeftEdge:)];
    edge.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edge];
}


- (void)handleSwipeFromLeftEdge:(UIScreenEdgePanGestureRecognizer *)gesture {
    CGPoint translate = [gesture translationInView:gesture.view];
    CGFloat percent   = translate.x / gesture.view.bounds.size.width;
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:TRUE];
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.interactionController updateInteractiveTransition:percent];
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [gesture velocityInView:gesture.view];
        if (percent > 0.5 || velocity.x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

#pragma mark - UINavigationControllerDelegate protocol methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        return [DismissAnimator new];
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    return self.interactionController;
}

@end
