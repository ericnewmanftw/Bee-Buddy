//
//  HiveTableViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/13/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "HiveTableViewController.h"
#import "ViewController.h"
#import "InspectionTableViewController.h"

@interface HiveTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *dates;


@end

@implementation HiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   
    self.sections = @[@"2014", @"2015"];
    self.dates = @[@"April 25th", @"May 6th"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSString *date = self.dates[indexPath.row];
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inspection"];
    cell.textLabel.text = self.dates[indexPath.row];
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
      //return self.sections.count;
    return 1;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    switch (section) {
//        case 0:
//            return 0;
//            break;
//        case 1:
//            return self.dates.count;
//            break;
//            
//        default:
//            return 0;
//            break;
//    }
    return self.dates.count;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
////     Get the new view controller using [segue destinationViewController].
//    if ([segue.identifier isEqualToString:@"addEntry"]) {
//        InspectionTableViewController *inspectionVC = [segue destinationViewController];
//    }
////     Pass the selected object to the new view controller.

    
//}


@end
