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

import Foundation

class AYCountriesInteractor: AYCountriesInteractorProtocol {
    
  private var allCountries: [AYCountry] = []
  private var countries: [AYCountry] = []

  init() {
    self.allCountries = AYCountriesService.listOfCountries()
    self.allCountries.sort { c1, c2 in
      return c1.name.lowercased() < c2.name.lowercased()
    }
    self.countries = self.allCountries
  }
  
  func country(by index: Int) -> AYCountry? {
    return countries[index]
  }
  
  func count() -> Int {
    return countries.count
  }
  
  func query(_ query: Query) {
    switch query {
    case .code(let code):
      guard !code.isEmpty else {
        countries = allCountries
        break
      }
      
      countries = allCountries.filter {
        $0.code.lowercased().contains(code.lowercased())
      }
    case .name(let name):
      guard !name.isEmpty else {
        countries = allCountries
        break
      }
      
      countries = allCountries.filter {
        $0.name.lowercased().contains(name.lowercased())
      }
    case .phone(let phone):
      guard !phone.isEmpty else {
        countries = allCountries
        break
      }
      
      countries = allCountries.filter {
        $0.phoneCode.lowercased().contains(phone.lowercased())
      }
    }
  }
  
}
