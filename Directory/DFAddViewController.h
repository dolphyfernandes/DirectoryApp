//
//  DFAddViewController.h
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFAddViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *companyTextfield;
@property (retain, nonatomic) IBOutlet UITextField *lastNameTextfield;
@property (retain, nonatomic) IBOutlet UITextField *firstNameTextfield;
- (IBAction)doneButtonPressed:(id)sender;

@end
