//
//  JDFCurrencyTextField.h
//  LivePokerManager2012
//
//  Created by Joe Fryer on 19/01/2014.
//  Copyright (c) 2014 JoeFryer. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A drop-in replacement for UITextField, that makes it easy to show a monetary value. 
 
    To set the initial text, set it using @c text as normal, but set it as an unformatted numerical string (it will automatically be displayed as a currency string).
 
    The locale defaults to currentLocale, but it can be changed.
 */

@interface JDFCurrencyTextField : UITextField <UITextFieldDelegate>

/** The numeric value of currency string being displayed in the field.
 */
@property (nonatomic, readonly) NSNumber *numericValue;

/** The locale the the currency value is displayed in. The default is the currentLocale. If you are going to change this, you should do so before setting the field's text (otherwise the text that is set will be lost).
 */
@property (nonatomic, strong) NSLocale *locale;

@end
