//
//  View+Ext.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/1/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
    
    func hide(_ isHide: Bool) -> some View {
        self
            .opacity(isHide ? 0 : 1)
    }
    
    func formatPhoneNumber(_ input: String, needAddLines: Bool = true) -> String {
        var inputString: String = input
        if needAddLines {
            while inputString.count < 10 {
                inputString.append("_")
            }
        }
        
        let digits = inputString.replacingOccurrences(of: "[^0-9a-zA-Z_]", with: "", options: .regularExpression)
        let maxDigits = min(digits.count, 10)
        
        if maxDigits == 0 {
            return "(___) ___ - __ - __"
        }
        
        var formattedNumber = "("
        
        for i in 0..<maxDigits {
            let index = digits.index(digits.startIndex, offsetBy: i)
            let digit = digits[index]
            
            if i == 3 {
                formattedNumber += ") "
            } else if i == 6 || i == 8 {
                formattedNumber += " - "
            }
            
            formattedNumber += String(digit)
        }
        return formattedNumber
    } 
}

