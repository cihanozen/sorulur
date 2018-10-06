//
//  Validator.swift
//  sorulur
//
//  Created by Sinan Özman on 5.10.2018.
//  Copyright © 2018 Sinan Özman. All rights reserved.
//

import Foundation

class Validator: NSObject {
    static func isEmailValid(_ email: String) -> Bool {
        //TODO: FIXME
//        return validate(email, regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
        return false
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        return validate(password, regex: "^.{6,}$") && password != "Şifre"
    }
    
    static func isNameValid(_ name: String) -> Bool {
        return validate(name, regex: "^[-a-zA-ZığüşöçİĞÜŞÖÇ]+$") && name != "Ad"
    }
    
    static func isLastNameValid(_ lastName: String) -> Bool {
        return validate(lastName, regex: "^[A-Za-zığüşöçİĞÜŞÖÇ]{2,}$") && lastName != "Soyad"
    }
    
    static func isPhoneValid(_ phone: String) -> Bool {
        return validate(phone, regex: "^[1-9]{1}[0-9]{9}$")
    }
    
    static func isGenderValid(_ gender: String) -> Bool {
        return validate(gender, regex: "^Kadın|Erkek$")
    }
    
    fileprivate static func validate(_ text: String, regex: String) -> Bool {
        return Regex(regex).test(text)
    }
    
}
