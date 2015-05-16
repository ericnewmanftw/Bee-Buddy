//
//  InspectionViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/16/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "InspectionViewController.h"

@interface InspectionViewController () <UITableViewDataSource, UITableViewDelegate>

//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *items;

@end

@implementation InspectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.items = @[@"Queen", @"Eggs", @"Open Brood", @"Capped Brood", @"Uncapped Honey", @"Capped Honey", @"Frames Drawn", @"Notes", @"Picture", @"Delete"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
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
