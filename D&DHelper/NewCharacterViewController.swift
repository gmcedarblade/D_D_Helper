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
  
  
  @IBOutlet weak var backgroundTextField: UITextField!
  
  
  @IBOutlet weak var raceTextField: UITextField!
  
  
  @IBOutlet weak var alignmentTextField: UITextField!
  
  
  @IBOutlet weak var strengthTextField: UITextField!
  
  @IBOutlet weak var dexterityTextField: UITextField!
  
  @IBOutlet weak var constitutionTextField: UITextField!
  
  
  @IBOutlet weak var intelligenceTextField: UITextField!
  
  @IBOutlet weak var wisdomTextField: UITextField!
  
  
  @IBOutlet weak var charismaTextField: UITextField!
  
  var character: Character?
  
  let currentObjectIDKey = "currentObjectID"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(character?.objectID.uriRepresentation().absoluteString, forKey: currentObjectIDKey)
    
    coder.encode(characterNameTextField.text, forKey: "nameText")
    coder.encode(classTextField.text, forKey: "classText")
    coder.encode(levelTextField.text, forKey: "levelText")
    coder.encode(backgroundTextField.text, forKey: "backgroundText")
    coder.encode(raceTextField.text, forKey: "raceText")
    coder.encode(alignmentTextField.text, forKey: "alignmentText")
    coder.encode(strengthTextField.text, forKey: "strengthText")
    coder.encode(dexterityTextField.text, forKey: "dexterityText")
    coder.encode(constitutionTextField.text, forKey: "constitutionText")
    coder.encode(intelligenceTextField.text, forKey: "intelligenceText")
    coder.encode(wisdomTextField.text, forKey: "wisdomText")
    coder.encode(charismaTextField.text, forKey: "charismaText")
    
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
    
    if let name = coder.decodeObject(forKey: "nameText") as? String {
      
      characterNameTextField.text = name
      
    }
    
    if let characterClass = coder.decodeObject(forKey: "classText") as? String {
      
      classTextField.text = characterClass
      
    }
    
    if let level = coder.decodeObject(forKey: "levelText") as? String {
      
      levelTextField.text = level
      
    }
    
    if let background = coder.decodeObject(forKey: "backgroundText") as? String {
      
      backgroundTextField.text = background
      
    }
    
    
    if let race = coder.decodeObject(forKey: "raceText") as? String {
      
      raceTextField.text = race
      
    }
    
    
    if let alignment = coder.decodeObject(forKey: "alignmentText") as? String {
      
      alignmentTextField.text = alignment
      
    }
    
    if let strength = coder.decodeObject(forKey: "strengthText") as? String {
      
      strengthTextField.text = strength
      
    }
    
    if let dexterity = coder.decodeObject(forKey: "dexterityText") as? String {
      
      dexterityTextField.text = dexterity
      
    }
    
    if let constitution = coder.decodeObject(forKey: "constitutionText") as? String {
      
      constitutionTextField.text = constitution
      
    }
    
    if let intelligence = coder.decodeObject(forKey: "intelligenceText") as? String {
      
      intelligenceTextField.text = intelligence
      
    }
    
    if let wisdom = coder.decodeObject(forKey: "wisdomText") as? String {
      
      wisdomTextField.text = wisdom
      
    }
    
    if let charisma = coder.decodeObject(forKey: "charismaText") as? String {
      
      charismaTextField.text = charisma
      
    }
    
    super.decodeRestorableState(with: coder)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    characterNameTextField.text = character?.name
    if classTextField.text != nil {
      classTextField.text = character?.characterClass
    }
    if levelTextField.text != nil {
      levelTextField.text = character?.level
    }
    if backgroundTextField.text != nil {
      backgroundTextField.text = character?.background
    }
    if raceTextField.text != nil {
    raceTextField.text = character?.race
    }
    if alignmentTextField.text != nil {
    alignmentTextField.text = character?.alignment
    }
    if strengthTextField.text != nil {
    strengthTextField.text = character?.strength
    }
    if dexterityTextField.text != nil {
    dexterityTextField.text = character?.dexterity
    }
    if constitutionTextField.text != nil {
    constitutionTextField.text = character?.constitution
    }
    if intelligenceTextField.text != nil {
    intelligenceTextField.text = character?.intelligence
    }
    if wisdomTextField.text != nil {
    wisdomTextField.text = character?.wisdom
    }
    if charismaTextField.text != nil {
    charismaTextField.text = character?.charisma
    }
    
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
    
    character?.setValue(characterNameTextField.text, forKey: "name")
    character?.setValue(classTextField.text, forKey: "characterClass")
    character?.setValue(levelTextField.text, forKey: "level")
    character?.setValue(backgroundTextField.text, forKey: "background")
    character?.setValue(raceTextField.text, forKey: "race")
    character?.setValue(alignmentTextField.text, forKey: "alignment")
    character?.setValue(strengthTextField.text, forKey: "strength")
    character?.setValue(dexterityTextField.text, forKey: "dexterity")
    character?.setValue(constitutionTextField.text, forKey: "constitution")
    character?.setValue(intelligenceTextField.text, forKey: "intelligence")
    character?.setValue(wisdomTextField.text, forKey: "wisdom")
    character?.setValue(charismaTextField.text, forKey: "charisma")
    
    
    
    do {
      try context.save()
      presentAlert(title: "Success", message: "You have updated your character")
      
    } catch {
      let saveError = error as NSError
      print(saveError)
    }
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }

}
