//
//  BaseDAO.h
//  FINEXPOIOS
//
//  Created by Xu Xian on 13-10-24.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDAO : NSObject{
    NSManagedObjectContext *objectContext;
}

-(NSArray *)fetchAll;

-(NSArray *)fetchWithIDs:(NSArray *)IDs;

-(NSArray *)fetchWithLimit:(NSUInteger)limit;

-(void)save;

-(void)insertWithDictionary:(NSDictionary *)dict;

-(void)insertWithArray:(NSArray *)array;

-(void)insertOrUpdateWithArray:(NSArray *)array;

-(void)updateEntity:(id)entity withDictionary:(NSDictionary *)dict;

-(id)createEntity;

@end
