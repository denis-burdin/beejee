//
//  Contact+Mappings.m
//  contacts
//
//  Created by Dennis Burdin on 28.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import "Contact+Mappings.h"

@implementation Contact (Mappings)

+ (NSString *)primaryKey {
    return @"contactID";
}


+ (NSDictionary *)mappings {
    return @{
             @"contactID"      : [self primaryKey],
             @"firstName"      : @"firstName",
             @"lastName"       : @"lastName",
             @"phoneNumber"    : @"phoneNumber",
             @"streetAddress1" : @"streetAddress1",
             @"streetAddress2" : @"streetAddress2",
             @"city"           : @"city",
             @"state"          : @"state",
             @"zipCode"        : @"zipCode",
             };
}

@end
