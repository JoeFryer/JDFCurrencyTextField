//
//  ViewController.m
//  JDFCurrencyTextField
//
//  Created by Joe Fryer on 23/02/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import "ViewController.h"
#import "JDFCurrencyTextField.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currencyField.text = @"100";
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    recognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:recognizer];
}

- (void)handleTap
{
    [self.view endEditing:YES];
}


@end
