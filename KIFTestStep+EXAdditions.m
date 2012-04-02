//
//  KIFTestStep+EXAdditions.m
//  Directory
//
//  Created by Dolphy Fernandes on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KIFTestStep+EXAdditions.h"

@implementation KIFTestStep (EXAdditions)

#pragma mark - Factory Steps

+ (id)stepToReset;
{
    return [KIFTestStep stepWithDescription:@"Reset the application state." executionBlock:^(KIFTestStep *step, NSError **error) {
        BOOL successfulReset = YES;
        
        // Do the actual reset for your app. Set successfulReset = NO if it fails.
        
        KIFTestCondition(successfulReset, error, @"Failed to reset some part of the application.");
        
        return KIFTestStepResultSuccess;
    }];
}

#pragma mark - Step Collections

+ (NSArray *)stepsToGoToLoginPage;
{
    NSMutableArray *steps = [NSMutableArray array];
    
    // Dismiss the welcome message
    [steps addObject:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Jim Vancover - Pam Macy"]];
    [steps addObject:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Close"]];
    
//    // Tap the "I already have an account" button
//    [steps addObject:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"I already have an account."]];
    
    return steps;
}

#pragma mark - Step Collections

+ (id)stepToEnterText:(NSString *)text
{
    NSString *description = [NSString stringWithFormat:@"Type the text \"%@\"", text];
    return [self stepWithDescription:description executionBlock:^(KIFTestStep *step, NSError **error){
        
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, false);
        
        for (NSUInteger characterIndex = 0; characterIndex < [text length]; characterIndex++) 
        {
            NSString *characterString = [text substringWithRange:NSMakeRange(characterIndex, 1)];
            
            if (![self performSelector:@selector(_enterCharacter:) withObject:characterString]) 
            {
                //no other option for us
            }
        }
        
        return KIFTestStepResultSuccess;
    }];
}


+ (NSArray *)stepsToAddPerson;
{
    NSMutableArray *steps = [NSMutableArray array];
    
    // Dismiss the welcome message
    [steps addObject:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Add"]];
    [steps addObject:[KIFTestStep stepToEnterText:@"DAFFY" intoViewWithAccessibilityLabel:@"firstNameTextfield"]];
    [steps addObject:[KIFTestStep stepToEnterText:@"abc" intoViewWithAccessibilityLabel:@"lastNameTextfield"]];
    [steps addObject:[KIFTestStep stepToEnterText:@"pqr" intoViewWithAccessibilityLabel:@"companyTextfield"]];
    [steps addObject:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Done"]];

    return steps;
}

@end