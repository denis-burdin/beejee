//
//  ContactsViewController.m
//  contacts
//
//  Created by Dennis Burdin on 30.07.17.
//  Copyright © 2017 beejee. All rights reserved.
//

#import "ContactsViewController.h"
#import "DataManager.h"
#import "TestCoreData.h"
#import "Contact+Mappings.h"
#import "ObjectiveRecord.h"
#import "AddNewContactViewController.h"

@interface ContactsViewController ()
{
    NSMutableArray* _contacts;
}
@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(addContact)];
    self.tableView.tableFooterView = [UIView new];

    [self initialize];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initialize];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialize {
    if (0 == [[Contact all] count]) {
        // replicate contacts from JSON test file ('testData')
        NSData* jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testData" ofType:nil]];
        [TestCoreData replicateDataFromJSON:jsonData];
    }
    
    _contacts = [NSMutableArray arrayWithArray:[[DataManager sharedManager] sortedArrayOfContacts]];
}

- (void)addContact {
    [self performSegueWithIdentifier:@"toContactDetails" sender:nil];
}

#pragma mark TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"contactTableViewCell"];
//    if(cell == nil) {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"contactTableViewCell"];
        Contact* dbContact = _contacts[indexPath.row];
        NSMutableAttributedString *userName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", dbContact.firstName, dbContact.lastName]];
        [userName beginEditing];
        [userName addAttribute:NSFontAttributeName
                      value:[UIFont boldSystemFontOfSize:cell.textLabel.font.pointSize]
                      range:NSMakeRange([dbContact.firstName length], [dbContact.lastName length] + 1)];
        [userName endEditing];
        [cell.textLabel setAttributedText:userName];
//    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact* selectedContact = (Contact*)_contacts[indexPath.row];
    [self performSegueWithIdentifier:@"toContactDetails" sender:selectedContact.contactID];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"toContactDetails"]) {
        AddNewContactViewController *vc = [segue destinationViewController];
        vc.contactID = (NSString*)sender;
    }
}


@end
