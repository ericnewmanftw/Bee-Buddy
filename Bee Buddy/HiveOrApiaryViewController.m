//
//  HiveOrApiaryViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 7/16/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "HiveOrApiaryViewController.h"

@interface HiveOrApiaryViewController ()

@end

@implementation HiveOrApiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem.title = @"Back";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
