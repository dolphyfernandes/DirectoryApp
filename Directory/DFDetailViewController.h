//
//  DFDetailViewController.h
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFDetailViewController : UIViewController

@property (nonatomic, assign) NSInteger indexSelected;
@property (retain, nonatomic) IBOutlet UILabel *firstNameValueLabel;
@property (retain, nonatomic) IBOutlet UILabel *lastNameValueLabel;
@property (retain, nonatomic) IBOutlet UILabel *companyValueLabel;

- (IBAction)onOkayButtonPressed:(id)sender;
@end
