//
//  PhoneTextField.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/1/24.
//

import SwiftUI
import Combine

struct PhoneTextField: View {
    
    @Binding var phone: String
    
    var body: some View {
        
        TextField("", text: $phone)
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.center)
            .foregroundStyle(Color.clear)
            .font(.system(size: 20))
            .tint(.clear)
            .focused($isFocused)
            .onReceive(Just(phone)) { newValue in//удаление лишнил символов
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    self.phone = filtered
                }
            }
            .background(//маска
                HStack(spacing: 8) {
                    Text("+7")
                    Text(newPhone)
                    Spacer()
                }
                    .foregroundStyle(Color.white)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 24)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(
                                Color.white.opacity(0.08)
                            )
                    )
                    .padding(.horizontal, 24)
                    .frame(maxHeight: 48)
                    .overlay(alignment: .leading) {//отрисовка курсора
                        HStack(spacing: 0) {
                            switch phone.isEmpty {
                                case false:
                                    Text(formatPhoneNumber(phone, needAddLines: false))
                                        .foregroundStyle(Color.clear)
                                        .font(.system(size: 16, weight: .medium))
                                default:
                                    EmptyView()
                            }
                            
                            Rectangle()//сам курсор
                                .fill(Color.white)
                                .frame(width: 2, height: 20)
                                .offset(x: phone.isEmpty ? 80 : 74)
                                .onReceive(timer) { _ in
                                    self.isBlinking.toggle()
                                }
                                .opacity((isBlinking && isFocused) ? 1 : 0)
                            Spacer()
                        }
                    }
            )
            .onChange(of: phone) {
                if phone.count >= 11 {
                    phone.removeLast()
                    hideKeyboard()
                } else {
                    newPhone = formatPhoneNumber(phone)
                }
            }
            .selectionDisabled()//не работает с textfield
    }
    
    @State private var isBlinking: Bool = .init(true)
    @State private var newPhone: String = .init("(___) ___ - __ - __")
    @FocusState private var isFocused: Bool
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
}

#Preview {
    struct PhoneTextFieldPreview: View {
        @State private var phone: String = .init()
        var body: some View {
            PhoneTextField(phone: $phone)
                .frame(maxHeight: .infinity)
                .background(Color.purple)
        }
    }
    
    return PhoneTextFieldPreview()
}
