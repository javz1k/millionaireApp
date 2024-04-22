//
//  ViewController.swift
//  millionaireApp
//
//  Created by Cavidan Mustafayev on 15.12.23.
//

import UIKit

struct Users: Codable {
    var name:String?
    var surname:String?
    var email:String?
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var submitButton:UIButton!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var surnameTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    
    var userRegisterData: Users?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.placeholder = "Name"
        surnameTextField.placeholder = "Surname"
        emailTextField.placeholder = "Email"
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        

    }
    

    func updateBorderColor(for textField: UITextField){
        let wordCount = textField.text?.count ?? 0
        
        if wordCount < 3 {
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
            textField.layer.borderColor = UIColor.red.cgColor
        }else{
            textField.layer.borderWidth = 0
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            updateBorderColor(for: nameTextField)
        case surnameTextField:
            updateBorderColor(for: surnameTextField)
        case emailTextField:
            updateBorderColor(for: emailTextField)
        default:
            break
        }
    }
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case  nameTextField:
                surnameTextField.becomeFirstResponder()
            case surnameTextField:
                emailTextField.becomeFirstResponder()
            case emailTextField:
                emailTextField.resignFirstResponder()
            default:
                break
            }
            return true
        }

    

    
    
    @IBAction func submitButtonAction(_ sender: Any) {
        let newRegistred = Users(name: nameTextField.text, surname: surnameTextField.text, email: emailTextField.text)
            userRegisterData = newRegistred
        
                print(userRegisterData ?? "no data in submitButtonAction")
        
                nameTextField.text = ""
                surnameTextField.text = ""
                emailTextField.text = ""
        
        
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AppViewController") as! AppViewController
        
        
        vc.setUser(newRegistred)
        UserDefaultsHelper.setBool(key: "test", value: true)
        UserDefaultsHelper.setCustom(value: newRegistred, key: "testCodable")
        
            navigationController?.pushViewController(vc, animated: true)
           
        
        

    }
    



}

