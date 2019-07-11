//
//  SignupVC.swift
//  MyForm
//
//  Created by RakeshPC on 11/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextFieldX!
    @IBOutlet weak var emailTextField: UITextFieldX!
    @IBOutlet weak var mobileTextField: UITextFieldX!
    @IBOutlet weak var passwordTextField: UITextFieldX!
    @IBOutlet weak var confirmPaddwordTextField: UITextFieldX!
    
    var name, email, mobile, password, cpassword: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func touchRegisterButton(_ sender: Any) {
        
        do {
            try register()
            
        } catch RegisterError.incompleteForm {
            showAlert(title: "Incomplete Form", message: "Please fill All fields.")
        } catch RegisterError.invalidEmail {
            showAlert(title: "Invalid Email Format", message: "Please make sure you formt your email correctly")
        } catch RegisterError.invalidMobile {
            showAlert(title: "Invalid Phone Format", message: "Please make sure you formt your phone number correctly")
        } catch RegisterError.incorrectPasswordLength {
            showAlert(title: "Password Too Short", message: "Password should be at least 8 characters")
        } catch RegisterError.incorrectConfirmPassword {
            showAlert(title: "Confirm Password", message: "COnfirm password should be same")
        }  catch {
            showAlert(title: "Unable To Register", message: "Ther was an error when attempting to Register")
        }
    }

}

extension SignupVC {
    fileprivate func register() throws {
        
         name = nameTextField.text!
         email = emailTextField.text!
         mobile = mobileTextField.text!
         password = passwordTextField.text!
         cpassword = confirmPaddwordTextField.text!
        
        if name.isEmpty || email.isEmpty || mobile.isEmpty || password.isEmpty || cpassword.isEmpty {
            throw RegisterError.incompleteForm
        }
        if !email.isValideEmail {
            throw RegisterError.invalidEmail
        }
        if !mobile.isValidContact {
            throw RegisterError.invalidMobile
        }
        if password.count < 8{
            throw RegisterError.incorrectPasswordLength
        }
        if password != cpassword {
            throw RegisterError.incorrectConfirmPassword
        }
    }
}


enum RegisterError: Error {
    case incompleteForm
    case invalidEmail
    case invalidMobile
    case incorrectPasswordLength
    case incorrectConfirmPassword
}
