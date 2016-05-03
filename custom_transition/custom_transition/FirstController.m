//
//  FirstController.m
//  custom_transition
//
//  Created by ghostpf on 15/12/10.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import "FirstController.h"
#import "TwoViewController.h"
#import "VVBaseNavigationController.h"

@interface FirstController ()

@end

@implementation FirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    VVBaseNavigationController *nav =  (VVBaseNavigationController *)self.navigationController;

    [nav pushViewController:[TwoViewController new] effect:YES];

    
    
    
}

- (void)dealloc
{
    
}

@end
