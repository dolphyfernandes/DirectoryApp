//
//  DFViewController.m
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DFViewController.h"
#import "DFAddViewController.h"
#import "DFDetailViewController.h"
#import "DFAppDelegate.h"
#import "Person.h"

@implementation DFViewController
@synthesize personTableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setPersonTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.personTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

# pragma mark - table view datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DFAppDelegate* del = [[UIApplication sharedApplication] delegate];
    return [[del peopleArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Person* personForCell = [[(DFAppDelegate*)[[UIApplication sharedApplication] delegate] peopleArray] objectAtIndex:indexPath.row];
    NSString* cellContent = [NSString stringWithFormat:@"%@ %@ - %@", [personForCell firstName], [personForCell lastName], [personForCell company]];
    cell.textLabel.text = cellContent;
    
    return cell;
}

-( void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"Tapped on Row" message:@"You have tapped on row" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease];
//    [alert show];
    DFDetailViewController* detailVC = [[[DFDetailViewController alloc] initWithNibName:@"DFDetailViewController" bundle:nil] autorelease];
    [self presentModalViewController:detailVC animated:YES];
}

- (IBAction)onAddButtonPressed:(id)sender {
    NSLog(@"add button pressed");
    DFAddViewController* addVC = [[[DFAddViewController alloc] initWithNibName:@"DFAddViewController" bundle:nil] autorelease];
    [self presentModalViewController:addVC animated:YES];
}
- (void)dealloc {
    [personTableView release];
    [super dealloc];
}
@end
