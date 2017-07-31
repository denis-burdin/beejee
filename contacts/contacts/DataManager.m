//
//  DataManager.m
//  contacts
//
//  Created by Dennis Burdin on 28.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import "DataManager.h"
#import "Contact+Mappings.h"
#import "ObjectiveRecord.h"

@implementation DataManager

+ (instancetype)sharedManager {
    static DataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

- (NSArray*)sortedArrayOfContacts {
    
    NSMutableArray *contacts = [NSMutableArray arrayWithArray:[Contact all]];
    
    if ([contacts count]) {
        NSArray *sortedContacts = [contacts sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSString* first = [(Contact*)obj1 lastName];
            NSString* second = [(Contact*)obj2 lastName];
            
            if ([first compare:second] == NSOrderedSame) {
                // if last names are equeal then compare first names alphabetically
                NSString* firstName1 = [(Contact*)obj1 firstName];
                NSString* firstName2 = [(Contact*)obj2 firstName];
                return [firstName1 compare:firstName2] == NSOrderedDescending;
            } else {
                return [first compare:second] == NSOrderedDescending;
            }
        }];
        
        return sortedContacts;
    }

    return nil;
}

@end
