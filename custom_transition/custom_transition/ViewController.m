//
//  ViewController.m
//  custom_transition
//
//  Created by ghostpf on 15/12/10.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import "ViewController.h"
#import "VVBaseNavigationController.h"
#import "FirstController.h"
#import "PushAnimation.h"
#import "PopAnimation.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [PushAnimation new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    PopAnimation *pop = [PopAnimation new];
    pop.type = ViewControlType_Model;
    return pop;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UIViewController *vc = [FirstController new];
//    vc.transitioningDelegate = self;
//    vc.modalPresentationStyle = UIModalPresentationCustom;
//    [self presentViewController:vc animated:YES completion:^{
//        
//    }];
    VVBaseNavigationController *nav = (VVBaseNavigationController *)self.navigationController;
    
    [nav pushViewController:vc effect:YES];
    
}

- (void)dealloc
{
    
}

@end
