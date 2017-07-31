//
//  AddNewContactViewController.h
//  contacts
//
//  Created by Dennis Burdin on 30.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewContactViewController : UIViewController

@property (nonatomic, strong) NSString* contactID;
@property (weak, nonatomic) IBOutlet UITextField *inputFirstName;
@property (weak, nonatomic) IBOutlet UITextField *inputLastName;
@property (weak, nonatomic) IBOutlet UITextField *inputPhone;
@property (weak, nonatomic) IBOutlet UITextField *inputAddress1;
@property (weak, nonatomic) IBOutlet UITextField *inputAddress2;
@property (weak, nonatomic) IBOutlet UITextField *inputCity;
@property (weak, nonatomic) IBOutlet UITextField *inputState;
@property (weak, nonatomic) IBOutlet UITextField *inputZipCode;
@property (weak, nonatomic) IBOutlet UIButton *buttonDelete;

- (IBAction)actionDelete:(id)sender;
- (IBAction)actionSave:(id)sender;

@end
