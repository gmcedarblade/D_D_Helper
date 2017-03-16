//
//  CharacterViewController.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/15/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//

import UIKit
import CoreData

class CharacterViewController: UITableViewController {
  
  override func viewDidAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = false
  }

  @IBOutlet weak var characterTable: UITableView!

  
  var characters: [NSManagedObject] = []
  
  override func viewDidLoad() {

    super.viewDidLoad()

    
  }
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Character")
    
    do {
      characters = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
  }
  
  
  @IBAction func addNewCharacter(_ sender: Any) {
    
    let alert = UIAlertController(title: "New Character", message: "Add a new character", preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) {
      [unowned self] action in
      
      guard let textField = alert.textFields?.first,
        let characterToSave = textField.text else {
          return
      }
      
      
      self.save(name: characterToSave)
      self.tableView.reloadData()
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .default)
    alert.addTextField()
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    present(alert, animated: true)
    
    
  }
  
  
  func save(name: String) {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Character", in: managedContext)!
    
    let character = NSManagedObject(entity: entity, insertInto: managedContext)
    
    character.setValue(name, forKeyPath: "name")
    
    do {
      try managedContext.save()
      characters.append(character)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
    
  }
  

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
    let character = characters[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Character", for: indexPath)
    
    cell.textLabel?.text = character.value(forKeyPath: "name") as? String
    
    return cell
    
  }
  
  
}

