//
//  DairyDao.m
//  FINEXPOIOS
//
//  Created by Xu Xian on 13-10-24.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import "DairyDAO.h"
#import "Dairy.h"
#import "DatabaseManager.h"
#import "Params.h"

@implementation DairyDAO

//access singleton in two ways: sharedDataManager and init
static DairyDAO *sharedDairyDAO = nil;
/* singleton */
+(DairyDAO *)sharedDairyDAO{
    @synchronized(self){
        if(!sharedDairyDAO){
            sharedDairyDAO = [[DairyDAO alloc]init];
        }
    }
    return sharedDairyDAO;
}
/* singleton */
-(id)init{
    if(!sharedDairyDAO){
        self = [super init];
        if(self){
            objectContext =[[DatabaseManager sharedDataManager] managedObjectContext];
            sharedDairyDAO = self;
        }
    }
    return sharedDairyDAO;
}


-(id)createEntity
{
    Dairy *newDairy = [NSEntityDescription insertNewObjectForEntityForName:TABLE_NAME_DAIRY inManagedObjectContext:objectContext];
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] * 1000;
    
    newDairy.createTime = interval;
    newDairy.updateTime = interval;
    
    return newDairy;
}

-(NSArray *)fetchAll{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_NAME_DAIRY inManagedObjectContext:objectContext];
    [request setEntity:entity];
    
    //set sort descriptor
    [request setSortDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"createTime" ascending:NO], nil]];
    
    NSError *error;
    NSArray *results = [objectContext executeFetchRequest:request error:&error];
    if(error){
        NSLog(@"couldn't fetchAll Dairy : %@",error.localizedDescription);
    }
    
    return results;
}

-(NSArray *)fetchWithIDs:(NSArray *)IDs
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TABLE_NAME_DAIRY inManagedObjectContext:objectContext];
    [request setEntity:entity];
    
    //set predicate
    [request setPredicate:[NSPredicate predicateWithFormat:@"flag = 0 AND SELF.booth_id in %@", IDs]];
    
    //set sort descriptor
    [request setSortDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"createTime" ascending:YES], nil]];
    
    NSError *error;
    NSArray *results = [objectContext executeFetchRequest:request error:&error];
    if(error){
        NSLog(@"couldn't fetch Dairy with IDs: %@",error.localizedDescription);
    }
    
    return results;
}

-(void)insertWithArray:(NSArray *)array{
    if(!array || array.count ==0){
        return;
    }
    for(NSDictionary *dict in array){
        [self insertWithDictionary:dict];
    }
}

-(void)save{
    NSError *error;
    if(![objectContext save:&error]){
        NSLog(@"couldn't save Booths : %@" , error.localizedDescription);
    }
}

@end
