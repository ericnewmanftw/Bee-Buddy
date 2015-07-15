//
//  HiveController.h
//  Bee Buddy
//
//  Created by Eric Newman on 5/23/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hive.h"
#import "Apiary.h"

@interface HiveController : NSObject

@property (nonatomic, strong) NSArray *hives;

+(HiveController *)sharedInstance;

-(void)removeHive:(Hive *)hive;

-(void)addHiveWithData:(NSString *)hiveName
           andLocation:(NSString *)hiveLocation;

-(void)addHiveWithData:(NSString *)hiveName andApiary:(Apiary *)apiary;




@end
