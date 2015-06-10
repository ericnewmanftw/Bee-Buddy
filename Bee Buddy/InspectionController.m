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

-(void)addInspectionWithQueen:(NSNumber *)queenSelected andEggs:(NSNumber *)eggsSelected andOBrood:(NSNumber *)oBroodSelected andCBrood:(NSNumber *)cBroodSelected andCHoney:(NSNumber *)cHoneySelected andNote:(NSString *)inspectionNotes andImage:(NSData *)inspectionImage{
    Inspection *inspection = [NSEntityDescription insertNewObjectForEntityForName:@"Inspection" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    inspection.queenSelected = queenSelected;
    inspection.eggsSelected = eggsSelected;
    inspection.openBSelected = oBroodSelected;
    inspection.cappedBSelected = cBroodSelected;
    inspection.cappedHoneySelected = cHoneySelected;
    inspection.note = inspectionNotes;
    inspection.image = inspectionImage;
    
    

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
