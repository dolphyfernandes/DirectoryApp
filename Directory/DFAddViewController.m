//
//  DFAddViewController.m
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DFAddViewController.h"
#import "DFAppDelegate.h"
#import "Person.h"

@implementation DFAddViewController
@synthesize companyTextfield;
@synthesize lastNameTextfield;
@synthesize firstNameTextfield;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    firstNameTextfield.accessibilityLabel = @"firstNameTextfield";
    lastNameTextfield.accessibilityLabel = @"lastNameTextfield";
    companyTextfield.accessibilityLabel = @"companyTextfield";
}

- (void)viewDidUnload
{
    [self setFirstNameTextfield:nil];
    [self setLastNameTextfield:nil];
    [self setCompanyTextfield:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) addPersonWithFirstName: (NSString*) firstName andLastName:(NSString*)lastName andCompany:(NSString*)company {
    Person* personAdd = [[[Person alloc] init] autorelease];
    [personAdd setFirstName:firstName];
    [personAdd setLastName:lastName];
    [personAdd setCompany:company];
    
    DFAppDelegate* del = [[UIApplication sharedApplication] delegate];
    [del.peopleArray addObject:personAdd];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self addPersonWithFirstName:[firstNameTextfield text] andLastName:[lastNameTextfield text] andCompany:[companyTextfield text]]; 
    [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [firstNameTextfield release];
    [lastNameTextfield release];
    [companyTextfield release];
    [super dealloc];
}
@end
