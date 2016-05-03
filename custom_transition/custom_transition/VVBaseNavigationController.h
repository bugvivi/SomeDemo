//
//  VVBaseNavigationController.h
//  custom_transition
//
//  Created by ghostpf on 15/12/11.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VVBaseNavigationController : UINavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController addPanGesture:(BOOL)gesture;
- (void)pushViewController:(UIViewController *)viewController effect:(BOOL)effect;
- (void)popViewControllerWithEffect:(BOOL)effect;


- (void)popToRootViewControllerWithEffect:(BOOL)effect;
@end
