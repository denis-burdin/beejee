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
#import "GRTJSONSerialization.h"

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
    
    
//    [GRTJSONSerialization JSONArrayFromObjects:];
    
    CFUUIDRef udid = CFUUIDCreate(NULL);
    NSString *udidString = (NSString *) CFBridgingRelease(CFUUIDCreateString(NULL, udid));
    Contact *dbContact = [Contact findOrCreate:@{[Contact primaryKey] : udidString}];
    [CoreDataManager.sharedManager saveContext];
}

- (void)testFillDBWithFirstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber
        streetAddress1:(NSString*)streetAddress1 streetAddress2:(NSString*)streetAddress2 city:(NSString*)city
             state:(NSString*)state zipCode:(NSString*)zipCode {
    CFUUIDRef udid = CFUUIDCreate(NULL);
    NSString *udidString = (NSString *) CFBridgingRelease(CFUUIDCreateString(NULL, udid));
    Contact *dbContact = [Contact findOrCreate:@{[Contact primaryKey] : udidString}];
    dbContact.firstName = firstName;
    dbContact.lastName = lastName;
    dbContact.phoneNumber = phoneNumber;
    dbContact.streetAddress1 = streetAddress1;
    dbContact.streetAddress2 = streetAddress2;
    dbContact.city = city;
    dbContact.state = state;
    dbContact.zipCode = zipCode;
    
    [CoreDataManager.sharedManager saveContext];
}

- (NSArray*)getContacts {
    
    NSMutableArray *contacts = [NSMutableArray new];
    for (Contact *dbContact in [Contact all]) {
        NSLog(@"");
    }

    return contacts;
}

@end
