//
//  Extensions.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/14/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//
//  Adapted from
//  Extensions.swift
//  MozAnalytics
//
//  Created by George Andrews on 10/22/16.
//

import Foundation
import UIKit

// MARK: - EZ Alerts
extension UIViewController {
  
  func presentAlert(title: String, message: String) {
    present(UIAlertController(title: title, message: message, preferredStyle: .alert).withOKAction())
  } // Note: preferredStyle of .Alert is required for iPads
  
  fileprivate func present(_ alertController: UIAlertController) {
    self.present(alertController, animated: true, completion: nil)
  }
}

extension UIAlertController {
  fileprivate func withOKAction() -> UIAlertController {
    addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    return self
  }
}
