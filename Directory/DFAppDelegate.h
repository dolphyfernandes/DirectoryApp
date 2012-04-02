//
//  DFAppDelegate.h
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DFViewController;

@interface DFAppDelegate : UIResponder <UIApplicationDelegate> {
    NSMutableArray* peopleArray;
}

@property (nonatomic, retain) NSMutableArray* peopleArray;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DFViewController *viewController;

@end
