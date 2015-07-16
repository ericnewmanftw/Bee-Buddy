//
//  ApiaryController.m
//  Bee Buddy
//
//  Created by Eric Newman on 6/3/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "ApiaryController.h"
#import "Stack.h"

@implementation ApiaryController

+(ApiaryController *)sharedInstance{
    static ApiaryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ApiaryController alloc]init];
    });
    return sharedInstance;
}

-(void)addApiaryWithData:(NSString *)apiaryName andLocation:(NSString *)apiaryLocation andNumberOfHives:(NSSet *)apiaryHives{
    
    Apiary *apiary = [NSEntityDescription insertNewObjectForEntityForName:@"Apiary" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    apiary.name = apiaryName;
    apiary.location = apiaryLocation;
    apiary.hives = [NSOrderedSet orderedSetWithSet:apiaryHives];
    
    [self syncronize];
     
}

-(void)removeApiary:(Apiary *)apiary {
    
    [[Stack sharedInstance].managedObjectContext deleteObject:apiary];
    [self syncronize];
    

}

-(void)syncronize {
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}

-(NSArray *)apiaries {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Apiary"];
    
    NSArray *apiaries = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return apiaries;
    
}

@end
