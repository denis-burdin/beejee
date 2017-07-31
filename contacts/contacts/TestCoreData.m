//
//  TestCoreData.m
//  contacts
//
//  Created by Dennis Burdin on 29.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import "TestCoreData.h"
#import "DataManager.h"
#import "Contact+Mappings.h"
#import "ObjectiveRecord.h"
#import "GRTJSONSerialization.h"

@implementation TestCoreData

+ (void)fillDataBaseWithTestData {
    [self testFillDBWithFirstName:@"Brian" lastName:@"Tracy" phoneNumber:@"+1(510)418-41-29" streetAddress1:@"727 Allston Way" streetAddress2:@"apt. 12" city:@"Berkeley" state:@"CA" zipCode:@"94710"];
    [self testFillDBWithFirstName:@"Tom" lastName:@"Lester" phoneNumber:@"+1(646)823-22-22" streetAddress1:@"138 Brighton Ave" streetAddress2:@"apt. 8" city:@"Belleville" state:@"NJ" zipCode:@"07109"];
    [self testFillDBWithFirstName:@"Patrick" lastName:@"Dobens" phoneNumber:@"+1(652)981-31-17" streetAddress1:@"1200 Market St" streetAddress2:@"apt. 716" city:@"Philadelphia" state:@"PA" zipCode:@"19107"];
    [self testFillDBWithFirstName:@"Evan" lastName:@"Barale" phoneNumber:@"+1(834)261-19-45" streetAddress1:@"2 Bishop P L Scott Ave" streetAddress2:@"" city:@"St. Louis" state:@"MO" zipCode:@"63113"];
    [self testFillDBWithFirstName:@"Will" lastName:@"Raymer" phoneNumber:@"+1(510)789-39-34" streetAddress1:@"133 7th Ave N" streetAddress2:@"apt. 22" city:@"Nashville" state:@"TN" zipCode:@"37203"];
    [self testFillDBWithFirstName:@"Dana" lastName:@"Keller" phoneNumber:@"+1(646)832-11-92" streetAddress1:@"1026 Herman St" streetAddress2:@"" city:@"Nashville" state:@"TN" zipCode:@"37208"];
    [self testFillDBWithFirstName:@"Connie" lastName:@"Vanest" phoneNumber:@"+1(832)732-93-83" streetAddress1:@"705 Douglas Ave" streetAddress2:@"" city:@"Nashville" state:@"TN" zipCode:@"37207"];
    [self testFillDBWithFirstName:@"Daniel" lastName:@"Adlouni" phoneNumber:@"+1(876)872-22-64" streetAddress1:@"554 Broyles St SE" streetAddress2:@"" city:@"Atlanta" state:@"GA" zipCode:@"30312"];
    [self testFillDBWithFirstName:@"Cindy" lastName:@"Jensen" phoneNumber:@"+1(832)323-23-86" streetAddress1:@"334 Woodward Ave SE" streetAddress2:@"" city:@"Atlanta" state:@"GA" zipCode:@"30312"];
    [self testFillDBWithFirstName:@"Matt" lastName:@"Jaffa" phoneNumber:@"+1(872)309-17-37" streetAddress1:@"351 Washington Ave NE" streetAddress2:@"apt. 29" city:@"Marietta" state:@"GA" zipCode:@"30060"];
}

+ (void)testFillDBWithFirstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber
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

+ (NSString*)exportDataBaseToJSON {
    
    NSArray *contacts = [GRTJSONSerialization JSONArrayFromObjects:[Contact all]];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:contacts
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (! jsonData) {
        return nil;
    }

    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (void)replicateDataFromJSON:(NSData*)jsonData {
    
    NSError *error;
    NSArray *contactsArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    for (NSDictionary* contact in contactsArray) {
        [GRTJSONSerialization objectWithEntityName:@"Contact"
                                                    fromJSONDictionary:contact
                                                             inContext:[CoreDataManager.sharedManager managedObjectContext]
                                                                 error:&error];
        [CoreDataManager.sharedManager saveContext];
    }
}

@end
