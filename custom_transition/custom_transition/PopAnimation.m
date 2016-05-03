//
//  PopAnimation.m
//  custom_transition
//
//  Created by ghostpf on 15/12/10.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import "PopAnimation.h"

@implementation PopAnimation

#pragma mark - Animated Transitioning

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //The view controller's view that is presenting the modal view
    UIView * containerView = [transitionContext containerView];
    
    if (_type==ViewControlType_Model) {
        UIView * fromView   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        UIView * toView     = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
        
        UIView * snapTo     = [toView snapshotViewAfterScreenUpdates:NO];
        
        [containerView insertSubview:snapTo aboveSubview:fromView];
        
        CGRect toViewEndFrame   = fromView.frame;
        CGRect toViewBeginFrame = CGRectMake(-fromView.frame.size.width, fromView.frame.origin.y, toView.frame.size.width, toView.frame.size.height);
        CGRect fromViewEndFrame = CGRectMake(fromView.frame.size.width, fromView.frame.origin.y, fromView.frame.size.width, fromView.frame.size.height);
        
        snapTo.frame = toViewBeginFrame;
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            snapTo.frame = toViewEndFrame;
            fromView.frame = fromViewEndFrame;
            
        } completion:^(BOOL finished) {
            [snapTo removeFromSuperview];
            
            [transitionContext completeTransition:YES];
        }];
    }else if (_type==ViewControlType_Nav){
        
        UIView * fromView   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        UIView * toView     = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
        
        CGRect toViewEndFrame   = fromView.frame;
        CGRect toViewBeginFrame = CGRectMake(-fromView.frame.size.width, fromView.frame.origin.y, toView.frame.size.width, toView.frame.size.height);
        CGRect fromViewEndFrame = CGRectMake(fromView.frame.size.width, fromView.frame.origin.y, fromView.frame.size.width, fromView.frame.size.height);
        
        UIView * snapFrom   = [fromView.window snapshotViewAfterScreenUpdates:NO];
        UIView * snapTo     = [toView.window snapshotViewAfterScreenUpdates:NO];
        
        toView.frame = toViewBeginFrame;
        snapFrom.frame = fromView.frame;
        snapTo.frame = toViewBeginFrame;
        
        [containerView insertSubview:snapFrom aboveSubview:fromView];
        [containerView addSubview:toView];
        [containerView insertSubview:snapTo aboveSubview:toView];
        

        

        
        [UIView animateWithDuration:0.5 animations:^{
            snapTo.frame = toViewEndFrame;
            toView.frame = toViewEndFrame;
            fromView.frame = fromViewEndFrame;
            snapFrom.frame = fromViewEndFrame;
            
        } completion:^(BOOL finished) {
            [snapFrom removeFromSuperview];
            [snapTo removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
        
    }
    

    
}

@end
