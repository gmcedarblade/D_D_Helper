//
//  Character.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/16/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//

import Foundation
import CoreData

@objc(Character)
public class CharacterClass: NSManagedObject {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Character> {
    return NSFetchRequest<Character>(entityName: "Character");
  }
  
  @NSManaged public var alignment: String?
  @NSManaged public var armorClass: String?
  @NSManaged public var background: String?
  @NSManaged public var characterClass: String?
  @NSManaged public var charisma: String?
  @NSManaged public var constitution: String?
  @NSManaged public var dexterity: String?
  @NSManaged public var experiencePoints: String?
  @NSManaged public var hitPoints: String?
  @NSManaged public var initiative: String?
  @NSManaged public var intelligence: String?
  @NSManaged public var level: String?
  @NSManaged public var name: String?
  @NSManaged public var race: String?
  @NSManaged public var speed: String?
  @NSManaged public var strength: String?
  @NSManaged public var wisdom: String?
  
  public override func value(forKey key: String) -> Any? {
    
    switch key {
    case "name": return name
    case "characterClass": return characterClass
    case "level": return level
    default: return nil
    }
    
  }
  
}

