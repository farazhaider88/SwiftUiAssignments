//
//  HelperMethodes.swift
//  Assignment1
//
//  Created by Syed Faraz Haider Zaidi on 18/12/2023.
//

import SwiftUI

func validateEmail(email:String) -> Bool {
    // Simple email validation using regular expression
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with:email )
}

func validateName(name:String) -> Bool{
    if !name.isEmpty {
        return true
    } else {
        return false
    }
}


func validatePassword(password:String) -> Bool{
    // Simple password length validation
    return password.count >= 8
}
