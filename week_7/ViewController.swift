//
//  ViewController.swift
//  week_7
//
//  Created by Mark D. Raden on 9/28/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passField: UITextField!
    
    @IBAction func backgroundTapped(_ sender :UITapGestureRecognizer) {
        
        self.nameField.resignFirstResponder()
        self.phoneField.resignFirstResponder()
        self.emailField.resignFirstResponder()
        self.passField.resignFirstResponder()
        print("Background was tapped!")
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool
    {
        var acceptChanges = true
        
        let text_original = textField.text ?? ""
        var text_new = String(text_original)
        guard let sRange = Range(range, in: text_original) else {return false}
        text_new.replaceSubrange(
            sRange,
            with: string
        )
        
        print("Original text: \(text_original)")
        print("Changing to: \(text_new)")
        
        switch( textField.textContentType )
        {
        case UITextContentType.emailAddress:
            print("Checking email change")
            if self.patternChecker.checkEmailString(text_new) {
                print("Email change seems to be okay")
            }
            else {
                print("Email change rejected!")
                acceptChanges = false
            }
            
        case UITextContentType.telephoneNumber:
            print("Checking phone number change")
            if self.patternChecker.checkPhoneString(text_new) {
                print("Phone change seems to be okay")
            }
            else {
                print("Phone change rejected!")
                acceptChanges = false
            }
        default:
            print("Default content type: won't check against pattern.")
        }
        
        return acceptChanges
    }
}

