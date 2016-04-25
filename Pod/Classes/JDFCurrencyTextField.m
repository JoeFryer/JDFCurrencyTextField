//
//  JDFCurrencyTextField.m
//  LivePokerManager2012
//
//  Created by Joe Fryer on 19/01/2014.
//  Copyright (c) 2014 JoeFryer. All rights reserved.
//

#import "JDFCurrencyTextField.h"



@interface JDFCurrencyTextField ()

// Formatter
@property (nonatomic, strong) NSNumberFormatter *currencyFormatter;
@property (nonatomic, strong) NSNumberFormatter *decimalFormatter;

// Delegate
@property (nonatomic, weak) id<UITextFieldDelegate> realDelegate;

@end



@implementation JDFCurrencyTextField

@synthesize locale = _locale;

#pragma mark - Setters

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self formatTextAfterEditing];
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    self.realDelegate = delegate;
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType
{
    if (keyboardType == UIKeyboardTypeDecimalPad || keyboardType == UIKeyboardTypeNumbersAndPunctuation) {
        [super setKeyboardType:keyboardType];
    }
}

- (void)setLocale:(NSLocale *)locale
{
    _locale = locale;
    self.currencyFormatter.locale = locale;
}

- (void)setDecimalValue:(NSDecimalNumber *)decimalValue
{
    self.text = [self.decimalFormatter stringFromNumber:decimalValue];
    [self formatTextAfterEditing];
}


#pragma mark - Getters

- (NSLocale *)locale
{
    if (!_locale) {
        _locale = [NSLocale currentLocale];
    }
    return _locale;
}

- (NSNumberFormatter *)currencyFormatter
{
    if (!_currencyFormatter) {
        _currencyFormatter = [[NSNumberFormatter alloc] init];
        [_currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [_currencyFormatter setLocale:self.locale];
    }
    return _currencyFormatter;
}

- (NSNumberFormatter *)decimalFormatter
{
    if (!_decimalFormatter) {
        _decimalFormatter = [[NSNumberFormatter alloc] init];
        [_decimalFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [_decimalFormatter setLocale:self.locale];
        _decimalFormatter.usesGroupingSeparator = NO;
    }
    return _decimalFormatter;
}

- (NSDecimalNumber *)decimalValue
{
    NSNumberFormatter *numberFormatter;
    if (self.editing) {
        numberFormatter = self.decimalFormatter;
    } else {
        numberFormatter = self.currencyFormatter;
    }
    return [NSDecimalNumber decimalNumberWithDecimal:[[numberFormatter numberFromString:self.text] decimalValue]];
}


#pragma mark - Init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)customInit
{
    [super setDelegate:self];
    self.keyboardType = UIKeyboardTypeDecimalPad;
    [self formatTextAfterEditing];
}


#pragma mark - Internal

- (void)formatTextInPreparationForEditing
{
    NSString *currentString = self.text;
    if (!(currentString.length > 0)) {
        return;
    }
    
    NSNumber *number = [self.currencyFormatter numberFromString:currentString];
    if (number.doubleValue == 0) {
        super.text = @"";
    } else {
        super.text = [self.decimalFormatter stringFromNumber:number];
    }
}

- (void)formatTextAfterEditing
{
    NSString *currentString = self.text;
    
    NSNumber *number = [self.decimalFormatter numberFromString:currentString];
    if (!number) {
        number = [self.currencyFormatter numberFromString:currentString];
    }
    if (!number || currentString.length == 0) {
        number = @0;
    }
    
    super.text = [self.currencyFormatter stringFromNumber:number];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:self.currencyFormatter.minusSign]) {
        NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithDecimal:[[self.decimalFormatter numberFromString:textField.text] decimalValue]];
        decimalNumber = [decimalNumber decimalNumberByMultiplyingBy:[[NSDecimalNumber alloc] initWithInteger: -1]];
        [super setText:[self.decimalFormatter stringFromNumber:decimalNumber]];
        return NO;
    } else {
        NSString *resultantString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSNumber *number = [self.decimalFormatter numberFromString:resultantString];
        return (number ? YES : NO) || resultantString.length == 0;
    }
}


#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self formatTextInPreparationForEditing];
    if ([self.realDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.realDelegate textFieldDidBeginEditing:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self formatTextAfterEditing];
    if ([self.realDelegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.realDelegate textFieldDidEndEditing:self];
    }
}


#pragma mark - UITextFieldDelegate forwarding

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([self.realDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([self.realDelegate respondsToSelector:aSelector]) {
        return self.realDelegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
