//
//  ImageTableViewCell.h
//  Bee Buddy
//
//  Created by Eric Newman on 6/2/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InspectionTableViewController.h"

@interface ImageTableViewCell : UITableViewCell <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)buttonPressed:(id)sender;

@end
