//
//  MyDataManager.h
//  FINEXPOIOS
//
//  Created by Xu Xian on 13-10-24.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (void)removeOldDB;
- (void)addDefaultDB;
- (BOOL)dbIsExist;

-(NSManagedObject *)objectWithURIRepresentation:(NSString *)uriRepresentation;

+(id)sharedDataManager;

@end
