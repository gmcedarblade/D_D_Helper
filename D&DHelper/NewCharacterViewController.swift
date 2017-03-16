//
//  NewCharacterViewController.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/15/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//

import UIKit
import CoreData

class NewCharacterViewController: UIViewController {
  
  
  @IBOutlet weak var saveButton: UIButton!
  
  @IBOutlet weak var characterNameTextField: UITextField!
  
  
  @IBOutlet weak var classTextField: UITextField!
  
  
  @IBOutlet weak var levelTextField: UITextField!
  
  var characterName: String?
  var characterClass: String?
  var characterLevel: NSNumber?
  
  var characters: [NSManagedObject] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  public let formatter = NumberFormatter()
  
  public func stringToDecimal(string: String) -> NSDecimalNumber {
    return formatter.number(from: string) as? NSDecimalNumber ?? 0
  }
  

  @IBAction func saveNewCharacterButton(_ sender: Any) {
  
    
  }

}
