//
//  CharacterResult.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/14/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//

import Foundation
import CoreData

@objc(CharacterResult)
public class CharacterResult: NSManagedObject {
  
  @NSManaged public var alignment: String?
  @NSManaged public var armorClass: NSNumber?
  @NSManaged public var background: String?
  @NSManaged public var characterClass: String?
  @NSManaged public var charisma: String?
  @NSManaged public var constitution: NSNumber?
  @NSManaged public var dexterity: NSNumber?
  @NSManaged public var experiencePoints: NSNumber?
  @NSManaged public var hitPoints: NSNumber?
  @NSManaged public var initiative: NSNumber?
  @NSManaged public var intelligence: NSNumber?
  @NSManaged public var level: NSNumber?
  @NSManaged public var name: String?
  @NSManaged public var race: String?
  @NSManaged public var speed: NSNumber?
  @NSManaged public var strength: NSNumber?
  @NSManaged public var wisdom: NSNumber?
  
  public override func value(forKey key: String) -> Any? {
    
    switch key {
      case "name": return name
      case "characterClass": return characterClass
      case "level": return level
    default: return nil
    }
    
  }
  
}
