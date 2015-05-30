//
//  ViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 4/29/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "ViewController.h"
#import "ApiaryCell.h"
#import "HiveCell.h"
#import "Stack.h"
#import "HiveController.h"


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *apiaryArray;
@property (nonatomic, strong) NSArray *hiveArray;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.apiaryArray = @[@"Apiary 1", @"Apiary 2"];
    self.hiveArray = @[@"Hive 1", @"Hive 2"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.item <= self.apiaryArray.count-1) {
        
        ApiaryCell *apiaryCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"apiaryID" forIndexPath:indexPath];
        
        apiaryCell.apiaryLabel.text = self.apiaryArray[indexPath.row];
        
        return apiaryCell;
    }else if (indexPath.item <= (self.apiaryArray.count+[HiveController sharedInstance].hives.count)-1){
        
       HiveCell *hiveCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hiveID" forIndexPath:indexPath];
//        
//        hiveCell.hiveLabel.text = self.hiveArray[indexPath.row-(self.apiaryArray.count)];
//
//        return hiveCell;
        Hive *hive = [HiveController sharedInstance].hives[indexPath.row];
        hiveCell.hiveLabel.text = hive.name;
        
        return hiveCell;
        
    }else{
        UICollectionViewCell *createNew = [collectionView dequeueReusableCellWithReuseIdentifier:@"createNew" forIndexPath:indexPath];
        return createNew;
    }

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (self.apiaryArray.count + [HiveController sharedInstance].hives.count)+1;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
    
}




@end
