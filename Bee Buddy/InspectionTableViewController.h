//
//  InspectionTableViewController.h
//  Bee Buddy
//
//  Created by Eric Newman on 5/19/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hive.h"
#import "InspectionController.h"

@interface InspectionTableViewController : UITableViewController
@property (nonatomic, strong) NSString *noteString;
@property (nonatomic, strong) Hive *hive;
@property (nonatomic, strong) Inspection *inspection;

@property (nonatomic, assign) BOOL queenSelected;
@property (nonatomic, assign) BOOL eggsSelected;
@property (nonatomic, assign) BOOL oBroodSelected;
@property (nonatomic, assign) BOOL cBroodSelected;
@property (nonatomic, assign) BOOL cHoneySelected;


@end
