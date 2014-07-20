//
//  ViewController.h
//  JDFCurrencyTextField
//
//  Created by Joe Fryer on 23/02/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDFCurrencyTextField;

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet JDFCurrencyTextField *currencyField;

@end
