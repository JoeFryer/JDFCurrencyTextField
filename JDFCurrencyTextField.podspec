#
# Be sure to run `pod lib lint JDFCurrencyTextField.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JDFCurrencyTextField"
  s.version          = "2.1.1"
  s.summary          = "A drop-in replacement for UITextField to make it easier to work with monetary values."
  s.description      = <<-DESC
                        JDFCurrencyTextField is a drop-in replacement for UITextField to make it easier to work with monetary values. JDFCurrencyTextField makes it easier to enter monetary values because it formats the cell's text as a numeric string while the user is editing it, and formats it back to a currency string when they have finished. It defaults to using the currentLocale for the formatting, but this can be changed if necessary.
                        DESC
  s.homepage         = "https://github.com/JoeFryer/JDFCurrencyTextField"
  s.license          = 'MIT'
  s.author           = { "Joe Fryer" => "joe.d.fryer@gmail.com" }
  s.source           = { :git => "https://github.com/JoeFryer/JDFCurrencyTextField.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/joefryer88'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.frameworks = 'UIKit'
end
