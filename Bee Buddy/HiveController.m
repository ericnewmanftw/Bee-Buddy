//
//  HiveController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/23/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "HiveController.h"
#import "Stack.h"

@implementation HiveController

+(HiveController *)sharedInstance{
    static HiveController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HiveController alloc]init];
    });
    return sharedInstance;
}

-(void)removeHive:(Hive *)hive{
    
    [[Stack sharedInstance].managedObjectContext deleteObject:hive];
    [self synchronize];
    
    
}

-(void)addHiveWithData:(NSString *)hiveName
                 andLocation:(NSString *)hiveLocation {
    
    Hive *hive = [NSEntityDescription insertNewObjectForEntityForName:@"Hive" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    hive.name = hiveName;
    hive.location = hiveLocation;
    
    [self synchronize];

    
    
}


-(void)synchronize {
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}

-(NSArray *)hives {
    NSFetchRequest *hiveRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hive"];
    
    NSArray *hives = [[Stack sharedInstance].managedObjectContext executeFetchRequest:hiveRequest error:NULL];
    
    return hives;
}

@end

