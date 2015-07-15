//
//  HiveTableViewController.h
//  Bee Buddy
//
//  Created by Eric Newman on 5/13/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hive.h"

@interface HiveTableViewController : UIViewController

@property (nonatomic, strong) Hive *hive;
@property (nonatomic, strong) NSOrderedSet *inspectionsSet;

@end

