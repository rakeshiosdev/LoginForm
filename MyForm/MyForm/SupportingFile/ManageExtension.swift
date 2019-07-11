//
//  ManageExtension.swift
//  MyForm
//
//  Created by RakeshPC on 11/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


extension String {
    
    var isValideEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicted = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicted.evaluate(with: self)
    }
    
    var isValidContact: Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
}
