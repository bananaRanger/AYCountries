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

public enum Query {
  case code(_ code: String)
  case name(_ name: String)
  case phone(_ phoneCode: String)
}

public class AYCountriesViewController: UIViewController, StoryboardLoadable {
  
  @IBOutlet weak var tableView: UITableView!
  
  var presenter: AYCountriesPresenterProtocol?
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    if presenter == nil {
      AYCountriesConfigurator.defaultConfigure(with: self)
    }
    presenter?.configureView()
    if let models = presenter?.cellModels {
      tableView.register(nibModels: models, for: AYCountriesViewController.self)
    }
  }
  
  public func fetch(with query: Query) {
    presenter?.query(query)
  }
  
  public func emptyTitle(_ title: String) {
    presenter?.emptyTitle = title
  }
  
  public func emptyMessage(_ message: String) {
    presenter?.emptyMesssage = message
  }
  
}

extension AYCountriesViewController: UITableViewDataSource {
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.presenter?.numberOfRowsInSection() ?? 0
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let model = presenter?.model(with: indexPath) {
      return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
    return UITableViewCell()
  }
  
}

extension AYCountriesViewController: UITableViewDelegate {
  
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    presenter?.selectCell(with: indexPath)
  }
  
}

extension AYCountriesViewController: AYCountriesViewProtocol {
  
  func reload() {
    tableView.reloadData()
  }
  
}
