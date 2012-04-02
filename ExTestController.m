//
//  ExTestController.m
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EXTestController.h"
#import "KIFTestScenario+ExAdditions.m"

@implementation EXTestController

- (void)initializeScenarios;
{
    [self addScenario:[KIFTestScenario scenarioToLogIn]];
    // Add additional scenarios you want to test here
}

@end