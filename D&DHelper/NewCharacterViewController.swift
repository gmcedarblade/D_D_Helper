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
  
  @IBOutlet weak var characterNameTextField: UITextField!
  
  
  @IBOutlet weak var classTextField: UITextField!
  
  
  @IBOutlet weak var levelTextField: UITextField!
  
  var characterName: String?
  var characterClass: String?
  var characterLevel: NSNumber?
  
  var characterData: NSDictionary?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  public let formatter = NumberFormatter()
  
  public func stringToDecimal(string: String) -> NSDecimalNumber {
    return formatter.number(from: string) as? NSDecimalNumber ?? 0
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "saveNewCharacterButton") {
      
      let svc = segue.destination as! CharacterViewController
      //svc.getData()
      
    }
  }
  @IBAction func saveNewCharacterButton(_ sender: Any) {
  
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let addCharacter = Character(context: context)
//    addCharacter.name = characterNameTextField.text
//    addCharacter.characterClass = classTextField.text
//    addCharacter.level = stringToDecimal(string: levelTextField.text!)
//    
//    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
    navigationController?.popViewController(animated: true)
    
  }

}
