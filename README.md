JDFCurrencyTextField
====================

JDFCurrencyTextField is a drop-in replacement for UITextField to allow the user to enter monetary values. JDFCurrencyTextField makes it easier to enter monetary values because it formats the cell's text as a number while the user is editing it, and formats it back to a currency string when they have finished. It defaults to using the currentLocale for the formatting, but this can be changed if necessary.

Usage
-----

JDFCurrencyTextField is a drop in replacement for UITextField - no further configuration is required. If you want to set the value, you can do so by setting the field's `text` with a numeric string (not formatted as currency), like so:

``` objc
JDFCurrencyTextField *currencyField = [[JDFCurrencyTextField alloc] initWithFrame:frame];
currencyField.text = @"100";
```

You can change the locale that is used for the currency formatting. To do this, set your JDFCurrencyTextField's `locale` property with your desired locale. You should do this before setting the `text` property, if you are doing both (otherwise, the value you set will be lost when the user begins editing).

JDFCurrencyTextField exposes the current value of the currency that has been entered as an NSNumber property, `numericValue`.

Installation
------------

All that is needed to use JDFCurrencyTextField is JDFCurrencyTextField.h & JDFCurrencyTextField.m. Simply copy these two files to your project to use.