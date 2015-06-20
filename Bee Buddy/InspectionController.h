//
//  InspectionController.h
//  Bee Buddy
//
//  Created by Eric Newman on 6/9/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "Inspection.h"
#import "Hive.h"

@interface InspectionController : NSObject

@property (nonatomic, strong) NSArray *inspections;

+(InspectionController  *)sharedInstance;

-(void)removeInspection:(Inspection *)inspection;

-(void)addInspectionWithQueen:(BOOL)queenSelected
                      andEggs:(BOOL)eggsSelected
                    andOBrood:(BOOL)oBroodSelected
                    andCBrood:(BOOL)cBroodSelected
                    andCHoney:(BOOL)cHoneySelected
                      andNote:(NSString *)inspectionNotes
                     andImage:(NSData *)inspectionImage
                      andDate:(NSDate *)inspectionDate
                      andHive:(Hive *)hive;



@end
