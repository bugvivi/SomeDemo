//
//  TwoViewController.m
//  custom_transition
//
//  Created by ghostpf on 15/12/11.
//  Copyright © 2015年 ghostpf. All rights reserved.
//

#import "TwoViewController.h"
#import "VVBaseNavigationController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    VVBaseNavigationController *nav = (VVBaseNavigationController *)self.navigationController;
    
    [nav popToRootViewControllerWithEffect:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
