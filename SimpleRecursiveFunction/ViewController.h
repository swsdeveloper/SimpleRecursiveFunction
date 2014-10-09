//
//  ViewController.h
//  SimpleRecursiveFunction
//
//  Created by Steven Shatz on 10/9/14.
//  Copyright (c) 2014 Steven Shatz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


-(void)printBigNumbers:(long int)bigNum;

-(NSString *)convertNumberToCommaFormattedString:(long int)num;

-(NSString *)formatIntWithCommas:(long int)num toNSString:(NSString *)commaFormattedNumber;


@end

