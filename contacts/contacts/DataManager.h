//
//  DataManager.h
//  contacts
//
//  Created by Dennis Burdin on 28.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)sharedManager;

- (void)replicateContactsFromArray:(NSArray*)contacts;
- (NSArray*)getContacts;
- (void)testFillDBWithFirstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber streetAddress1:(NSString*)streetAddress1 streetAddress2:(NSString*)streetAddress2 city:(NSString*)city state:(NSString*)state zipCode:(NSString*)zipCode;

@end
