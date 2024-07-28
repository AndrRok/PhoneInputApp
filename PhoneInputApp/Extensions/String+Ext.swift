//
//  String+Ext.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/5/24.
//

import Foundation

extension String {
    func formatPhoneNumber() -> String {
        // Очищаем строку от всего, кроме цифр
        let cleanedNumber = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        // Проверяем, что длина номера равна 10
        guard cleanedNumber.count == 10 else {
            return "-"
        }
        
        // Форматируем номер
        let areaCode = cleanedNumber.prefix(3)
        let prefix = cleanedNumber.dropFirst(3).prefix(3)
        let suffix = cleanedNumber.dropFirst(6).prefix(2) + "-" + cleanedNumber.dropFirst(8)
        
        return "+7 (\(areaCode)) \(prefix)-\(suffix)"
    }
    
    func phoneMaskString(needAddLines: Bool = true) -> String {
        var inputString: String = self
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
