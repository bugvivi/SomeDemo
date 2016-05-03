//
//  PushAnimation.m
//  custom_transition
//
//  Created by ghostpf on 15/12/10.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation

#pragma mark - Animated Transitioning

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //The view controller's view that is presenting the modal view
    UIView * containerView = [transitionContext containerView];
    
    UIView * fromView   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView * snapFrom       = [fromView.window snapshotViewAfterScreenUpdates:NO];
    
    UIView * toView     = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView * snapTo     = [toView.window snapshotViewAfterScreenUpdates:NO];
    
    
    CGRect toViewEndFrame   = fromView.frame;
    CGRect toViewBeginFrame = CGRectMake(fromView.frame.size.width, fromView.frame.origin.y, toView.frame.size.width, toView.frame.size.height);
    CGRect fromViewEndFrame = CGRectMake(-fromView.frame.size.width, fromView.frame.origin.y, fromView.frame.size.width, fromView.frame.size.height);
    
    
    toView.frame = toViewBeginFrame;
    [containerView addSubview:toView];
    snapTo.frame = toViewBeginFrame;
    [containerView insertSubview:snapTo aboveSubview:toView];
    
    snapFrom.frame = fromView.frame;
    [containerView insertSubview:snapFrom aboveSubview:fromView];
   



    
    
    [UIView animateWithDuration:0.5 animations:^{
        snapTo.frame = toViewEndFrame;
        toView.frame = toViewEndFrame;
        snapFrom.frame = fromViewEndFrame;
        
    } completion:^(BOOL finished) {
        [snapFrom removeFromSuperview];
        [snapTo removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
    
    
}

@end
