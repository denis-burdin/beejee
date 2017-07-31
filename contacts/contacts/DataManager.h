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
- (NSArray*)sortedArrayOfContacts;

@end
