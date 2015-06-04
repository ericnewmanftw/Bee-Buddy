//
//  ImageTableViewCell.h
//  Bee Buddy
//
//  Created by Eric Newman on 6/2/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InspectionTableViewController.h"
@protocol photoCellDelegate;

@interface ImageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *button;


@property (weak, nonatomic) id <photoCellDelegate>delegate;


- (IBAction)buttonPressed:(id)sender;

@end

@protocol photoCellDelegate <NSObject>

-(void)imageTapped;

@end