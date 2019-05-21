//
//  ViewController.swift
//  AYCountries-test
//
//  Created by Anton Yereshchenko on 5/21/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import UIKit
import AYCountries

class ViewController: UIViewController {

  @IBOutlet weak var lblMessage: UILabel!
  
  @IBAction func btnSelectCountryTouchUpInside(_ sender: UIButton) {
    let countriesVC = AYCountriesConfigurator.configure { [weak self] country, vc in
      guard let country = country else { return }
      self?.lblMessage.text =
        country.flag.appending(country.name)
          .appending("\n")
          .appending(country.phoneCodeWithPlus())
      vc.dismiss(animated: true, completion: nil)
    }
    present(countriesVC, animated: true, completion: nil)
  }
  
}

