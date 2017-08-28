//
//  InteractionTransitioningViewController.h
//  CustomViewControllerTransitions
//
//  Created by WorkStation on 8/27/17.
//  Copyright © 2017 WorkStation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractionTransitioningViewController : UIViewController<UINavigationControllerDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

@end
