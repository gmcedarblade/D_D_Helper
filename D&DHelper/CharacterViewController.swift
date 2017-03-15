//
//  CharacterViewController.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/15/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//

import UIKit

class CharacterViewController: UITableViewController {
  
  override func viewDidAppear(_ animated: Bool) {
    self.navigationController!.isNavigationBarHidden = false
  }
  
  @IBAction func backToMainMenu(_ sender: Any?) {
    
    self.dismiss(animated: true, completion: nil)
    
  }
  
 
  
}
