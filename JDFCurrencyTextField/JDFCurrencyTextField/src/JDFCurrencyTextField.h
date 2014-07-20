//
//  JDFCurrencyTextField.h
//  LivePokerManager2012
//
//  Created by Joe Fryer on 19/01/2014.
//  Copyright (c) 2014 JoeFryer. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A drop-in replacement for UITextField, that makes it easy to work with monetary values.
 
    You can set the value of the field, either by setting the @c text as normal, or by setting the @c decimalValue.
 
    The locale defaults to currentLocale, but it can be changed.
 */

@interface JDFCurrencyTextField : UITextField <UITextFieldDelegate>

/** The decimal value of text field.
 */
@property (nonatomic, strong) NSDecimalNumber *decimalValue;

/** The locale the the currency value is displayed in. The default is the currentLocale. If you are going to change this, you should do so before setting the field's text.
 */
@property (nonatomic, strong) NSLocale *locale;

@end
