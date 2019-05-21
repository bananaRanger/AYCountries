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

class AYCountriesPresenter: AYCountriesPresenterProtocol {
  
  weak var view: AYCountriesViewProtocol?
  var router: AYCountriesRouterProtocol?
  var interactor: AYCountriesInteractorProtocol?
  
  var cellModel: AYCellAnyViewModel.Type {
    if interactor?.count() == 0 {
      return AYEmpty.self
    }
    return AYCountry.self
  }
  
  var completionHandler: AYCountriesCompletionHandler?
  
  var defaultNumberOfRowsInSection: Int = 1

  init(with view: AYCountriesViewProtocol) {
    self.view = view
  }
  
  func configureView() {
    view?.reload()
  }
  
  func numberOfRowsInSection() -> Int {
    guard let count = interactor?.count() else {
      return defaultNumberOfRowsInSection
    }
    return count == 0 ? defaultNumberOfRowsInSection : count
  }
  
  func model(with indexPath: IndexPath) -> AYCellAnyViewModel? {
    if interactor?.count() == 0 {
      return AYEmpty.emptyDefault()
    }
    return interactor?.country(by: indexPath.row)
  }
  
  func selectCell(with indexPath: IndexPath) {
    guard numberOfRowsInSection() != 0,
      let country = self.interactor?.country(by: indexPath.row),
      let completionHandler = completionHandler,
      let viewController = view as? UIViewController else {
        return
    }
    completionHandler(country, viewController)
  }
  
}
