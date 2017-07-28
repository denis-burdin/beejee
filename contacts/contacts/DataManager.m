//
//  DataManager.m
//  contacts
//
//  Created by Dennis Burdin on 28.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import "DataManager.h"
#import "Contact+Mappings.h"
#import <ObjectiveRecord.h>

@implementation DataManager

+ (instancetype)sharedManager {
    static DataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

- (void)replicateContactsFromArray:(NSArray*)contacts {
    
    CFUUIDRef udid = CFUUIDCreate(NULL);
    NSString *udidString = (NSString *) CFBridgingRelease(CFUUIDCreateString(NULL, udid));
    Contact *dbContact = [Contact findOrCreate:@{[Contact primaryKey] : udidString}];
    [CoreDataManager.sharedManager saveContext];
}

- (NSArray*)getPosts {
    
    NSMutableArray *contacts = [NSMutableArray new];
    for (Contact *dbContact in [Contact all]) {
    }

    return contacts;
}

@end
