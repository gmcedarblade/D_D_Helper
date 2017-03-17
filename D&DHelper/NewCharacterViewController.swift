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
  
  var characters: [NSManagedObject] = []
  
  let currentObjectIDKey = "currentObjectID"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      fatalError()
    }
    
    let context = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Character")
    
    do {
      characters = try context.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    
  }
  
  public let formatter = NumberFormatter()
  
  public func stringToDecimal(string: String) -> NSDecimalNumber {
    return formatter.number(from: string) as? NSDecimalNumber ?? 0
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
    
    let character = characters[0] 
    
    character.setValue(characterNameTextField.text, forKey: "name")
    
    do {
      try context.save()
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
