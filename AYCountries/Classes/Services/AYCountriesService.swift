//
// Copyright (c) 2019 Anton Yereshchenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

protocol AYCountriesServiceProtocol {
  static func listOfCountries() -> [AYCountry]
  static func currentCountry() -> AYCountry?
}

class AYCountriesService: NSObject, AYCountriesServiceProtocol {
  
  static func listOfCountries() -> [AYCountry] {
    var countries: [AYCountry] = []
    
    guard let dictionary = AYFileService.dictionary(with: "code", and: "plist") else {
      return countries
    }
    
    dictionary.forEach { countryCode, phoneCode in
      guard let countryName = NSLocale.countryName(by: countryCode) else { return }
      let country = AYCountry(with: countryCode, name: countryName, phoneCode: phoneCode)
      countries.append(country)
    }
    
    return countries
  }
  
  static func currentCountry() -> AYCountry? {
    guard let currentCode = Locale.current.regionCode,
      let countryName = NSLocale.countryName(by: currentCode) else { return nil }
    return AYCountry(with: currentCode, name: countryName)
  }
  
}
