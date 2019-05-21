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

protocol AYFileServiceProtocol {
  static func dictionary(with fileName: String, and type: String) -> Dictionary<String, String>?
}

class AYFileService: NSObject, AYFileServiceProtocol {

  static func dictionary(with fileName: String, and type: String) -> Dictionary<String, String>? {
    let bundle = Bundle(for: self.self)
    var format = PropertyListSerialization.PropertyListFormat.xml
    guard let url = bundle.url(forResource: fileName, withExtension: type),
      let data = try? Data.init(contentsOf: url),
      let dictionary = try? PropertyListSerialization.propertyList(from: data, format: &format) as? [String : String] else {
        return nil
    }
    return dictionary
  }

}
