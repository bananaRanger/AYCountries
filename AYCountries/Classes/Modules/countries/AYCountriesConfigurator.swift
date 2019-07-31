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

public class AYCountriesConfigurator: AYCountriesConfiguratorProtocol {
  
  /**
   
   Module configuration method.
   
   - parameters:
      - locale: is a used locale. You can set it to *nil* to use system device local.
      - completionHandler: handler that calls when user have selected the country and
   return selected *AYCountry?* object and *UIViewController* to dismissing.
   
   - returns: Configurated AYCountriesViewController.
   
   */
  public static func configure(with locale: Locale? = nil, completionHandler: @escaping AYCountriesCompletionHandler) -> AYCountriesViewController {
    let bundle = Bundle(for: AYCountriesConfigurator.self)
    let viewController: AYCountriesViewController = UIStoryboard.loadViewController(with: bundle)
    let presenter = AYCountriesPresenter(with: viewController)
    let interactor = AYCountriesInteractor(locale: locale)
    presenter.interactor = interactor
    presenter.completionHandler = completionHandler
    viewController.presenter = presenter
    return viewController
  }
  
  public static func defaultConfigure(with viewController: AYCountriesViewController) {
    let presenter = AYCountriesPresenter(with: viewController)
    let interactor = AYCountriesInteractor()
    viewController.presenter = presenter
    presenter.interactor = interactor
  }

}
