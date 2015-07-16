//
//  InspectionController.m
//  Bee Buddy
//
//  Created by Eric Newman on 6/9/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "InspectionController.h"

@implementation InspectionController

+(InspectionController *)sharedInstance{
    static InspectionController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[InspectionController alloc]init];
    });
    return sharedInstance;
}

-(void)addInspectionWithQueen:(BOOL)queenSelected
                      andEggs:(BOOL)eggsSelected
                    andOBrood:(BOOL)oBroodSelected
                    andCBrood:(BOOL)cBroodSelected
                    andCHoney:(BOOL)cHoneySelected
                      andNote:(NSString *)inspectionNotes
                     andImage:(NSString *)inspectionImage
                      andDate:(NSDate *)inspectionDate
                      andHive:(Hive *)hive{
    
    Inspection *inspection = [NSEntityDescription insertNewObjectForEntityForName:@"Inspection" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    

    NSNumber *queenAsNumber = [NSNumber numberWithBool:queenSelected];
    inspection.queenSelected = queenAsNumber;
    
    NSNumber *eggsAsNumber = [NSNumber numberWithBool:eggsSelected];
    inspection.eggsSelected = eggsAsNumber;
    
    NSNumber *oBroodAsNumber = [NSNumber numberWithBool:oBroodSelected];
    inspection.openBSelected = oBroodAsNumber;
    
    NSNumber *cBroodAsNumber = [NSNumber numberWithBool:cBroodSelected];
    inspection.cappedBSelected = cBroodAsNumber;
    
    NSNumber *cHoneyAsNumber = [NSNumber numberWithBool:cHoneySelected];
    inspection.cappedHoneySelected = cHoneyAsNumber;
    
    inspection.note = inspectionNotes;
    inspection.image = inspectionImage;
    inspection.date = inspectionDate;
    inspection.hive = hive;
    
    
    [self syncronize];
    
}

-(void)syncronize {
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

-(void)removeInspection:(Inspection *)inspection{
    [[Stack sharedInstance].managedObjectContext deleteObject:inspection];
    [self syncronize];
}

-(NSArray *)inspections {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Inspection"];
    
    NSArray *inspections = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return inspections;
    
}


@end
