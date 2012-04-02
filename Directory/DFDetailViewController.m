//
//  DFDetailViewController.m
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DFDetailViewController.h"
#import "DFAppDelegate.h"
#import "Person.h"

@implementation DFDetailViewController
@synthesize indexSelected;
@synthesize firstNameValueLabel;
@synthesize lastNameValueLabel;
@synthesize companyValueLabel;

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
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    DFAppDelegate* del = [[UIApplication sharedApplication] delegate];
    Person* personSelected = (Person*)[del.peopleArray objectAtIndex:indexSelected];
    [self.firstNameValueLabel setText:[personSelected firstName]];
    [self.lastNameValueLabel setText:[personSelected lastName]];
    [self.companyValueLabel setText:[personSelected company]];
}
- (void)viewDidUnload
{
    [self setFirstNameValueLabel:nil];
    [self setLastNameValueLabel:nil];
    [self setCompanyValueLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [firstNameValueLabel release];
    [lastNameValueLabel release];
    [companyValueLabel release];
    [super dealloc];
}
- (IBAction)onOkayButtonPressed:(id)sender {
//    [NSThread sleepForTimeInterval:2];
    [self dismissModalViewControllerAnimated:YES];
}
@end
