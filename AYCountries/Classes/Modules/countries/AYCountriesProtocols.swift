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

public typealias AYCountriesCompletionHandler = (AYCountry?, UIViewController) -> ()

protocol AYCountriesConfiguratorProtocol: class {
  static func configure(with completionHandler: @escaping AYCountriesCompletionHandler) -> AYCountriesViewController
  static func defaultConfigure(with viewController: AYCountriesViewController)
}

protocol AYCountriesPresenterProtocol: class {
  var view: AYCountriesViewProtocol? { get set }
  var cellModels: [AYCellAnyViewModel.Type] { get }
  var completionHandler: AYCountriesCompletionHandler? { get set }
  var defaultNumberOfRowsInSection: Int { get }
  func configureView()
  func query(_ query: Query) 
  func numberOfRowsInSection() -> Int
  func model(with indexPath: IndexPath) -> AYCellAnyViewModel?
  func selectCell(with indexPath: IndexPath)
}

protocol AYCountriesInteractorProtocol: class {
  func country(by indexPath: Int) -> AYCountry?
  func count() -> Int
  func query(_ query: Query) 
}

protocol AYCountriesRouterProtocol: class {
  
}

protocol AYCountriesViewProtocol: class {
  func reload()
}

