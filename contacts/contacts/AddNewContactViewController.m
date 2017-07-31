//
//  AddNewContactViewController.m
//  contacts
//
//  Created by Dennis Burdin on 30.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import "AddNewContactViewController.h"
#import "ObjectiveRecord.h"
#import "Contact+Mappings.h"

@interface AddNewContactViewController ()
{
    Contact *_selectedContact;
}
@end

@implementation AddNewContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialize {
    if (self.contactID.length > 0) {
        NSArray *fetchedObjects;
        NSManagedObjectContext *context = [[CoreDataManager sharedManager] managedObjectContext];
        NSFetchRequest *fetch = [NSFetchRequest new];
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
        [fetch setEntity:entityDescription];
        [fetch setPredicate:[NSPredicate predicateWithFormat:@"(contactID = %@)", self.contactID]];
        NSError * error = nil;
        fetchedObjects = [context executeFetchRequest:fetch error:&error];

        if([fetchedObjects count] == 1) {
            _selectedContact = (Contact *)fetchedObjects[0];
            [self.inputFirstName setText:_selectedContact.firstName];
            [self.inputLastName setText:_selectedContact.lastName];
            [self.inputPhone setText:_selectedContact.phoneNumber];
            [self.inputAddress1 setText:_selectedContact.streetAddress1];
            [self.inputAddress2 setText:_selectedContact.streetAddress2];
            [self.inputCity setText:_selectedContact.city];
            [self.inputState setText:_selectedContact.state];
            [self.inputZipCode setText:_selectedContact.zipCode];
        }
    } else {
        // new contact
        // hide delete button
        [self.buttonDelete setHidden:YES];
        [self.inputFirstName setText:nil];
        [self.inputLastName setText:nil];
        [self.inputPhone setText:nil];
        [self.inputAddress1 setText:nil];
        [self.inputAddress2 setText:nil];
        [self.inputCity setText:nil];
        [self.inputState setText:nil];
        [self.inputZipCode setText:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionSave:(id)sender {

    Contact *theContact = nil;
    if (_selectedContact) {
        theContact = _selectedContact;
    } else {
        // create new contact
        CFUUIDRef udid = CFUUIDCreate(NULL);
        NSString *udidString = (NSString *) CFBridgingRelease(CFUUIDCreateString(NULL, udid));
        theContact = [Contact findOrCreate:@{[Contact primaryKey] : udidString}];
    }

    theContact.firstName = self.inputFirstName.text;
    theContact.lastName = self.inputLastName.text;
    theContact.phoneNumber = self.inputPhone.text;
    theContact.streetAddress1 = self.inputAddress1.text;
    theContact.streetAddress2 = self.inputAddress2.text;
    theContact.city = self.inputCity.text;
    theContact.state = self.inputState.text;
    theContact.zipCode = self.inputZipCode.text;
    
    [CoreDataManager.sharedManager saveContext];
    
    // go back
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)actionDelete:(id)sender {
    
    [_selectedContact delete];

    // go back
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    // hide keyboard on touch outside
    UITouch *touch = [[event allTouches] anyObject];
    if (![[touch view] isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
    [super touchesBegan:touches withEvent:event];
}

@end
