//
//  ViewController.swift
//  D&DHelper
//
//  Created by Gregory Cedarblade on 3/14/17.
//  Copyright © 2017 Gregory Cedarblade. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var usernameTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  
  @IBOutlet weak var saveButton: UIButton!
  
  
  var savedResults = [Character]()
  
  let keychainWrapper = KeychainWrapper()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    usernameTextField.delegate = self
    passwordTextField.delegate = self
    
    if UserDefaults.standard.bool(forKey: "hasCredentials") {
      
      usernameTextField.text = UserDefaults.standard.value(forKey: "usernameTextField") as? String
      passwordTextField.text = keychainWrapper.myObject(forKey: kSecValueData) as? String
      saveButton.setTitle("Change User", for: UIControlState())
      
    }
    
  }
  
  @IBAction func saveUserInfo(_ sender: Any) {
    
    if usernameTextField.hasText, passwordTextField.hasText {
      
      UserDefaults.standard.set(usernameTextField.text, forKey: "usernameTextField")
      UserDefaults.standard.set(true, forKey: "hasCredentials")
      UserDefaults.standard.synchronize()
      
      keychainWrapper.mySetObject(passwordTextField.text, forKey: kSecValueData)
      keychainWrapper.writeToKeychain()
      
      saveButton.setTitle("Change User", for: UIControlState())
      
    } else {
      
      presentAlert(title: "Notification", message: "You must enter both the username and password.")
      
    }
    
  }
  
  override func encodeRestorableState(with coder: NSCoder) {
    
    super.encodeRestorableState(with: coder)
    
    if (usernameTextField.text != nil) {
      coder.encode(usernameTextField.text, forKey: "usernameTextField")
    }
    if (passwordTextField.text != nil) {
      coder.encode(passwordTextField.text, forKey: "passwordTextField")
    }
    
    
  }
  
  override func decodeRestorableState(with coder: NSCoder) {
    
    super.decodeRestorableState(with: coder)
    if let userName = coder.decodeObject(forKey: "usernameTextField") as? String {
      
      usernameTextField.text = userName
      
    }
    
    if let password = coder.decodeObject(forKey: "passwordTextField") as? String {
      
      passwordTextField.text = password
      
    }
    
  }

}

// MARK: - UITextField Delegate

extension SettingsViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    return true
    
  }
  
}
