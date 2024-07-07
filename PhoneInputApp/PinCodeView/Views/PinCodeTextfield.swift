//
//  PinCodeTextfield.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/2/24.
//

import SwiftUI
import Combine

struct PinCodeTextfield: View {
    
    @Binding var pinCode: String//также можно использовать массив
    
    var body: some View {
        TextField("", text: $pinCode)
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.center)
            .foregroundStyle(Color.clear)
            .font(.system(size: 36, weight: .medium))
            .tint(.clear)
            .focused($isFocused)
            .onReceive(Just(pinCode)) { newValue in//удаление лишнил символов
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue, filtered.count < 5 {
                    self.pinCode = filtered
                }
            }
            .background() {
                HStack {
                    Text(getSymbol(string: pinCode, symbolId: 0))
                        .frame(minWidth: 22, minHeight: 44)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 22)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(
                                    Color.white.opacity(0.08)
                                )
                        )
                    
                    Text(getSymbol(string: pinCode, symbolId: 1))
                        .frame(minWidth: 22, minHeight: 44)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 22)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(
                                    Color.white.opacity(0.08)
                                )
                        )
                    
                    Text(getSymbol(string: pinCode, symbolId: 2))
                        .frame(minWidth: 22, minHeight: 44)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 22)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(
                                    Color.white.opacity(0.08)
                                )
                        )
                    
                    Text(getSymbol(string: pinCode, symbolId: 3))
                        .frame(minWidth: 22, minHeight: 44)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 22)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(
                                    Color.white.opacity(0.08)
                                )
                        )
                }
                .foregroundStyle(Color.white)
            }
            .font(.system(size: 36, weight: .medium))
            .padding(.bottom, 24)
    }
    
    func getSymbol(string: String, symbolId: Int) -> String {
        if symbolId < string.count {
            return String(string[string.index(string.startIndex, offsetBy: symbolId)])
            
        } else {
            return ""
        }
    }
    
    @FocusState private var isFocused: Bool
}

#Preview {
    struct PinCodeTextfieldPreview: View {
        @State private var pinCode: String = .init()
        var body: some View {
            PinCodeTextfield(pinCode: $pinCode)
                .frame(maxHeight: .infinity)
                .background(Color.purple)
        }
    }
    
    return PinCodeTextfieldPreview()
}
