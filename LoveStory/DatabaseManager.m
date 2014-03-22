//
//  MyDataManager.m
//  FINEXPOIOS
//
//  Created by Xu Xian on 13-10-24.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import "DatabaseManager.h"

@implementation DatabaseManager{
    
}
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


#pragma mark - Singleton
//access singleton in two ways: sharedDataManager and init
static DatabaseManager *sharedDataManager = nil;
/* singleton */
+(id)sharedDataManager{
    @synchronized(self){
        if(!sharedDataManager){
            sharedDataManager = [[DatabaseManager alloc]init];
        }
    }
    return sharedDataManager;
}
/* singleton */
-(id)init{
    if(!sharedDataManager){
        sharedDataManager = [super init];
    }
    return sharedDataManager;
}

#pragma mark- Save Context
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

-(NSManagedObject *)objectWithURIRepresentation:(NSString *)uriRepresentation
{
    NSError *error;
    NSManagedObject *object = [self.managedObjectContext existingObjectWithID:[[self persistentStoreCoordinator] managedObjectIDForURIRepresentation:[NSURL URLWithString:uriRepresentation]] error:&error];
    if(error)
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    return object;
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        //set undo manager inorder to rollback
        NSUndoManager *undoMgr = [[NSUndoManager alloc] init];
        [_managedObjectContext setUndoManager:undoMgr];
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    //set undo manager inorder to rollback
    NSUndoManager *undoMgr = [[NSUndoManager alloc] init];
    [_managedObjectContext setUndoManager:undoMgr];
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"xxx.sqlite"];
         
         */
        
        
        //轻量的数据迁移
        //light migration
        NSError *error = nil;
        NSDictionary * opt = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:opt error:&error]){
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)removeOldDB{
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    NSURL *storeURLSHM = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite-shm"];
    NSURL *storeURLWAL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite-wal"];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:storeURL.relativePath]){
        NSLog(@"exist");
        //remove old db
        NSError *error;
        if (![[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
    
    if([[NSFileManager defaultManager] fileExistsAtPath:storeURLSHM.relativePath]){
        NSLog(@"exist");
        //remove old db
        NSError *error;
        if (![[NSFileManager defaultManager] removeItemAtURL:storeURLSHM error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
    
    if([[NSFileManager defaultManager] fileExistsAtPath:storeURLWAL.relativePath]){
        NSLog(@"exist");
        //remove old db
        NSError *error;
        if (![[NSFileManager defaultManager] removeItemAtURL:storeURLWAL error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
}

- (void)addDefaultDB{
    //add default db
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Model.sqlite"];
    NSString *defaultDBPathSHM = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Model.sqlite-shm"];
    NSString *defaultDBPathWAL = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Model.sqlite-wal"];
    
    NSError *error;
    
    BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:[self getDBPathWithFileName:@"model.sqlite"] error:&error];
    if (!success)
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    
    success = [fileManager copyItemAtPath:defaultDBPathSHM toPath:[self getDBPathWithFileName:@"model.sqlite-shm"] error:&error];
    if (!success)
        NSAssert1(0, @"Failed to create writable database shm file with message '%@'.", [error localizedDescription]);
    
    success = [fileManager copyItemAtPath:defaultDBPathWAL toPath:[self getDBPathWithFileName:@"model.sqlite-wal"] error:&error];
    if (!success)
        NSAssert1(0, @"Failed to create writable database wal file with message '%@'.", [error localizedDescription]);
}

- (NSString *) getDBPathWithFileName:(NSString *)fileName
{
    //Search for standard documents using NSSearchPathForDirectoriesInDomains
    //First Param = Searching the documents directory
    //Second Param = Searching the Users directory and not the System
    //Expand any tildes and identify home directories.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    //NSLog(@"dbpath : %@",documentsDir);
    return [documentsDir stringByAppendingPathComponent:fileName];
}

-(BOOL)dbIsExist{
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:storeURL.relativePath];
}

@end
