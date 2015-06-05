//
//  ApiaryViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/21/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "ApiaryViewController.h"
#import "HiveCollectionViewCell.h"
#import "Hive.h"

@interface ApiaryViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *hiveArray;


@end

@implementation ApiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hiveArray = self.apiary.hives.allObjects;
    
//    self.hiveArray = @[@"Hive A", @"Hive B", @"The Cool Hive", @"Hive 13", @"Hive 42"];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HiveCollectionViewCell *hiveCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseHiveCell" forIndexPath:indexPath];
    Hive *hive = self.hiveArray[indexPath.row];
    hiveCell.hiveLabel.text = hive.name;
    
    
    return hiveCell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hiveArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
    
}

- (IBAction)addHive:(id)sender {
    //[self.apiary addHivesObject:hive];
    
    
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
