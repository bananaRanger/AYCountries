# AYCountries

[![CI Status](https://img.shields.io/travis/antonyereshchenko@gmail.com/AYCountries.svg?style=flat)](https://travis-ci.org/antonyereshchenko@gmail.com/AYCountries)
[![Version](https://img.shields.io/cocoapods/v/AYCountries.svg?style=flat)](https://cocoapods.org/pods/AYCountries)
[![License](https://img.shields.io/cocoapods/l/AYCountries.svg?style=flat)](https://cocoapods.org/pods/AYCountries)
[![Platform](https://img.shields.io/cocoapods/p/AYCountries.svg?style=flat)](https://cocoapods.org/pods/AYCountries)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## About

A list of countries with flags and phone codes.

A single UIViewController with UITableView that display list of countries for selection.

![](https://github.com/bananaRanger/AYCountries/blob/master/Screenshots/demo.png?raw=true)

## Installation

AYCountries is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
inhibit_all_warnings!

target 'YOUR-TARGET-NAME' do
  use_frameworks!
	pod 'AYCountries'
end
```

## Usage

```swift
// 'country' - object of class 'AYCountry' (selected country).
// 'vc' - object of class 'UIViewController' (countries list).
// 'countriesViewController' - created object of class 'UIViewController' with list of countries.

let countriesViewController = AYCountriesConfigurator.configure { [weak self] country, vc in
  print(country?.name)
  vc.dismiss(animated: true, completion: nil)
}
present(countriesViewController, animated: true, completion: nil)

countriesViewController.fetch(with: Query.name("ukr")) // fetch countries that contains 'ukr' in the name (case insensitive)
```


## Author

Anton Yereshchenko

## License

AYCountries is available under the MIT license. See the LICENSE file for more info.
