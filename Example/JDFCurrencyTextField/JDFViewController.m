//
//  JDFViewController.m
//  JDFCurrencyTextField
//
//  Created by Joe Fryer on 07/20/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import "JDFViewController.h"
#import "JDFCurrencyTextField.h"


@interface JDFViewController ()

@end


@implementation JDFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDecimalNumber *value = [[NSDecimalNumber alloc] initWithDouble:9.99];
    self.currencyField.decimalValue = value;
    self.currencyField.delegate = self;
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    recognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:recognizer];
}

- (void)handleTap
{
    [self.view endEditing:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"Value: %@", ((JDFCurrencyTextField *)textField).decimalValue);
    NSLog(@"Text: %@", textField.text);
}

@end
