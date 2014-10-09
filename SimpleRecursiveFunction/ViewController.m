//
//  ViewController.m
//  SimpleRecursiveFunction
//
//  Created by Steven Shatz on 10/9/14.
//  Copyright (c) 2014 Steven Shatz. All rights reserved.
//

#import "ViewController.h"


// The next define strips off the date/time stamp and current directory info from the start of each NSLog line
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


#define MYDEBUG 0     // set to 1 to enable debug print statements; set to 0 to disable



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // **************************************************************
    // * Test Comma Formatted Number function - demos Recursiveness *
    // **************************************************************
    
    NSLog(@"*** Start of Tests ***\n");
    
    long int bigNumber;
    
    bigNumber = 1;                  [self printBigNumbers:bigNumber];
    bigNumber = 123;                [self printBigNumbers:bigNumber];
    bigNumber = 1234;               [self printBigNumbers:bigNumber];
    bigNumber = 1000;               [self printBigNumbers:bigNumber];
    bigNumber = 1001;               [self printBigNumbers:bigNumber];
    bigNumber = 1010;               [self printBigNumbers:bigNumber];
    bigNumber = 1110;               [self printBigNumbers:bigNumber];
    bigNumber = 1000000;            [self printBigNumbers:bigNumber];
    bigNumber = 12345678901234567;  [self printBigNumbers:bigNumber];
    bigNumber = -12;                [self printBigNumbers:bigNumber];
    bigNumber = -1230;              [self printBigNumbers:bigNumber];
    bigNumber = -1234567890;        [self printBigNumbers:bigNumber];
    
    NSLog(@"*** End of Tests ***");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// *************************************************************************
// * Recursive function to turn a long int into a comma-formatted NSString *
// *************************************************************************

-(void)printBigNumbers:(long int)bigNum {
    NSLog( @"in:%ld --> out:\"%@\"\n", bigNum, [self convertNumberToCommaFormattedString:bigNum] );
}


-(NSString *)convertNumberToCommaFormattedString:(long int)num {
    NSString *commaFormattedNumber = @"";
    return [self formatIntWithCommas:(long int)num toNSString:commaFormattedNumber];
}


-(NSString *)formatIntWithCommas:(long int)num toNSString:(NSString *)commaFormattedNumber {
    
    if (MYDEBUG) { NSLog(@"Debugging: num:%ld  string:%@", num, commaFormattedNumber); }
    
    // ONE-TIME TEST: Print "-" for negative num, then make num positive for remaining iterations
    
    if (num < 0) {
        commaFormattedNumber = [commaFormattedNumber stringByAppendingString:@"-"];
        commaFormattedNumber = [self formatIntWithCommas:-num toNSString:commaFormattedNumber];
        
        if (MYDEBUG) { NSLog(@"num<0: string so far: %@", commaFormattedNumber); }
        
        return commaFormattedNumber;
    }
    
    // STOP CONDITION: This is as deep as we will go since num has been reduced to only its leftmost 1 to 3 digits
    
    if (num < 1000) {
        NSString *numAsNSString = [NSString stringWithFormat:@"%ld",num];
        commaFormattedNumber = [commaFormattedNumber stringByAppendingString:numAsNSString];
        
        if (MYDEBUG) { NSLog(@"num<1000: string so far: %@", commaFormattedNumber); }
        
        return commaFormattedNumber;
    }
    
    // RECURSIVE SITUATION: Num has at least 4 digits, so keep iterating until we reach STOP CONDITION
    // When we return to here, print a comma and the last 3 digits of num at this stage
    // Then return again, either higher up the recursive chain or if this is the top, return from the entire function
    
    commaFormattedNumber = [self formatIntWithCommas:(num/1000) toNSString:commaFormattedNumber];
    
    NSString *numAsNSString = [NSString stringWithFormat:@"%3.3ld",num % 1000];   // Need %3.3ld to print remainder "0" as "000", "10" as "010", et. al.
                                                                                  // first "3" is Max print size; ".3" is Min print size
  
    commaFormattedNumber = [commaFormattedNumber stringByAppendingString:@","];
    commaFormattedNumber = [commaFormattedNumber stringByAppendingString:numAsNSString];
    
    if (MYDEBUG) { NSLog(@"num>=1000: string so far: %@", commaFormattedNumber); }
    
    return commaFormattedNumber;
}

@end
