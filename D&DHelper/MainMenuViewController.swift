//
//  MainMenuViewController.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/15/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    // 1. Check for credentials
    if UserDefaults.standard.bool(forKey: "hasCredentials") {
      
      self.tabBarController?.selectedIndex = 0
      
    } else {
      // 2. No credentials, send to settings
      self.tabBarController?.selectedIndex = 1
    }
  }
  
}
