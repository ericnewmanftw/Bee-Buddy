//
//  NotesViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/20/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "NotesViewController.h"

@interface NotesViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation NotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender {
}

- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
