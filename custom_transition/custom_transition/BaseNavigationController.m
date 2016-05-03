//
//  BaseNavigationController.m
//  custom_transition
//
//  Created by ghostpf on 15/12/10.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import "BaseNavigationController.h"
#import "PushAnimation.h"
#import "PopAnimation.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}



#pragma mark - Navigation Controller Delegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    switch (operation) {
        case UINavigationControllerOperationPush:
            
            return  [PushAnimation new];
        case UINavigationControllerOperationPop:
        {
            PopAnimation *pop = [PopAnimation new];
            pop.type = ViewControlType_Nav;
            return pop;
        }
           
            
        default: return nil;
    }
    
}

//-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
//    
//    return nil;
//}

@end
