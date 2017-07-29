//
//  TestCoreData.m
//  contacts
//
//  Created by Dennis Burdin on 29.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import "TestCoreData.h"
#import "DataManager.h"

@implementation TestCoreData

+ (void)fillDataBaseWithTestData {
    [[DataManager sharedManager] testFillDBWithFirstName:@"Brian" lastName:@"Tracy" phoneNumber:@"+1(510)418-41-29" streetAddress1:@"727 Allston Way" streetAddress2:@"apt. 12" city:@"Berkeley" state:@"CA" zipCode:@"94710"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Tom" lastName:@"Lester" phoneNumber:@"+1(646)823-22-22" streetAddress1:@"138 Brighton Ave" streetAddress2:@"apt. 8" city:@"Belleville" state:@"NJ" zipCode:@"07109"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Patrick" lastName:@"Dobens" phoneNumber:@"+1(652)981-31-17" streetAddress1:@"1200 Market St" streetAddress2:@"apt. 716" city:@"Philadelphia" state:@"PA" zipCode:@"19107"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Evan" lastName:@"Barale" phoneNumber:@"+1(834)261-19-45" streetAddress1:@"2 Bishop P L Scott Ave" streetAddress2:@"" city:@"St. Louis" state:@"MO" zipCode:@"63113"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Will" lastName:@"Raymer" phoneNumber:@"+1(510)789-39-34" streetAddress1:@"133 7th Ave N" streetAddress2:@"apt. 22" city:@"Nashville" state:@"TN" zipCode:@"37203"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Dana" lastName:@"Keller" phoneNumber:@"+1(646)832-11-92" streetAddress1:@"1026 Herman St" streetAddress2:@"" city:@"Nashville" state:@"TN" zipCode:@"37208"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Connie" lastName:@"Vanest" phoneNumber:@"+1(832)732-93-83" streetAddress1:@"705 Douglas Ave" streetAddress2:@"" city:@"Nashville" state:@"TN" zipCode:@"37207"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Daniel" lastName:@"Adlouni" phoneNumber:@"+1(876)872-22-64" streetAddress1:@"554 Broyles St SE" streetAddress2:@"" city:@"Atlanta" state:@"GA" zipCode:@"30312"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Cindy" lastName:@"Jensen" phoneNumber:@"+1(832)323-23-86" streetAddress1:@"334 Woodward Ave SE" streetAddress2:@"" city:@"Atlanta" state:@"GA" zipCode:@"30312"];
    [[DataManager sharedManager] testFillDBWithFirstName:@"Matt" lastName:@"Jaffa" phoneNumber:@"+1(872)309-17-37" streetAddress1:@"351 Washington Ave NE" streetAddress2:@"apt. 29" city:@"Marietta" state:@"GA" zipCode:@"30060"];
}

@end
