//
//  LoginVC.swift
//  MyForm
//
//  Created by RakeshPC on 11/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextFieldX!
    @IBOutlet weak var passwordTextField: UITextFieldX!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationSetting()
    }
    fileprivate func navigationSetting(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func touchLoginButton(_ sender: Any) {
        
        do {
            try login()
            print("Every thing right1")
            
        } catch LoginError.incompleteForm {
            showAlert(title: "Incomplete Form", message: "Please fill out both email and password fields.")
        } catch LoginError.invalidEmail {
            showAlert(title: "Invalid Email Format", message: "Please make sure you formt your email correctly")
        } catch LoginError.incorrectPasswordLength {
            showAlert(title: "Password Too Short", message: "Password should be at least 8 characters")
        } catch {
            showAlert(title: "Unable To Login", message: "Ther was an error when attempting to login")
        }
        
    }
    
    @IBAction func touchRegisterButton(_ sender: Any) {
        let objSignupvc: SignupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(objSignupvc, animated: true)
    }
}

extension LoginVC {
    fileprivate func login() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        if !email.isValideEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
    }
}

enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
}
