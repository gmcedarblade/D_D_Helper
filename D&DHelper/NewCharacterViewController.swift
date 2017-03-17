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
  
  var character: Character?
  
  let currentObjectIDKey = "currentObjectID"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(character?.objectID.uriRepresentation().absoluteString, forKey: currentObjectIDKey)
    super.encodeRestorableState(with: coder)
  }
  
  override func decodeRestorableState(with coder: NSCoder) {
    if let currentObjectIDKey = coder.decodeObject(forKey: currentObjectIDKey) as? String {
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      let context = appDelegate.persistentContainer.viewContext
      
      if let url = URL(string: currentObjectIDKey),
        let objectID = context.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: url) {
        character = context.object(with: objectID) as? Character
      }
      
    }
    super.decodeRestorableState(with: coder)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    characterNameTextField.text = character?.name
    classTextField.text = character?.characterClass
    levelTextField.text = character?.level
    
  }
  
  public let formatter = NumberFormatter()
  
  public func stringToDecimal(string: String) -> NSDecimalNumber {
    formatter.numberStyle = .decimal
    return formatter.number(from: String(string)) as! NSDecimalNumber
  }

  @IBAction func saveNewCharacterButton(_ sender: Any) {
    
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        fatalError("Couldn't get the appDelegate!")
      }
//
//      let context = appDelegate.persistentContainer.viewContext
//      
//      guard let entity = NSEntityDescription.entity(forEntityName: "Character", in: context) else {
//        fatalError("Couldn't create a new Character entity.")
//      }
//      
//      let characterResult = NSManagedObject(entity: entity, insertInto: context)
//      
//      characterResult.name = characters.value(forKey: "name") as? String
//      
//      do {
//        try context.save()
//        
//        presentAlert(title: "Success", message: "Your character data has been saved")
//      } catch let error as NSError {
//        print("Could not save \(error), \(error.userInfo)")
//        presentAlert(title: "Error", message: "Sorry, there was a problem saving your data.")
//      }
//      print("3")
//    }
    

    let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    let entityDescription = NSEntityDescription.entity(forEntityName: "Character", in: context)
    fetchRequest.entity = entityDescription
    
    do {
      let result = try context.execute(fetchRequest)
      print(result)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    //let newInfo = NSManagedObject(entity: entityDescription!, insertInto: context)
    
    
    
    //} else {
      //newInfo.setValue(characterNameTextField.text, forKey: "name")
      
    //}
    
    //if (character?.characterClass != nil) {
    
    //} else {
      //newInfo.setValue(classTextField.text, forKey: "characterClass")
    //}
    
    character?.setValue(characterNameTextField.text, forKey: "name")
    character?.setValue(classTextField.text, forKey: "characterClass")
    character?.setValue(levelTextField.text, forKey: "level")
    //print(character?.level)
    
    do {
      try context.save()
      presentAlert(title: "Success", message: "You have updated your character")
      
    } catch {
      let saveError = error as NSError
      print(saveError)
    }
    
  }
  

  
//  override func encodeRestorableState(with coder: NSCoder) {
//    coder.encode(characters.objectID.entity, forKey: currentObjectIDKey)
//    super.encodeRestorableState(with: coder)
//  }
  
//  override func decodeRestorableState(with coder: NSCoder) {
//    if let currentObjectIDKey = coder.decodeObject(forKey: currentObjectIDKey) as? String {
//      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//        return
//      }
//      
//      let context = appDelegate.persistentContainer.viewContext
//      
//      if let url = URL(string: currentObjectIDKey),
//        let objectID = context.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: url) {
//        
//        characters = context.object(with: objectID) as? NSManagedObject
//        
//      }
//    
//    }
//    
//    super.decodeRestorableState(with: coder)
//  }
  

}
