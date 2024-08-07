//
//  ContentView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 6/30/24.
//

import SwiftUI
import Combine

struct PhoneInputView: View {
    
    @State private var phone: String = .init()
    @State private var timer: PinCodeTimer = PinCodeTimer()
    
    var body: some View {
        NavigationStack {
            
                
             
                
                VStack(alignment: .center, spacing: 0) {
                    authoriztaionTitle
                    
                    avatarImage
                    
                    phoneNumberLoginTitle
                    
                    PhoneTextField(phone: $phone)
                        .padding(.bottom, 34)
                    
                    askThePinCodeButton
                    
                }
                .customBackgroundImage()
                .frame(maxWidth: 400)
            
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

private extension PhoneInputView {
    
    var authoriztaionTitle: some View {
        Text(LocalizedStringKey("authorize"))
            .foregroundStyle(Color.white)
            .font(.system(size: 24, weight: .semibold))
            .padding(.bottom, 28)
            .padding(.top, 40)
            .padding(.horizontal, 24)
    }
    
    var avatarImage: some View {
        Image(.avatar)
            .resizable()
            .frame(maxWidth: 100, maxHeight: 100)
            .padding(.bottom, 16)
            .padding(.horizontal, 24)
    }
    
    var phoneNumberLoginTitle: some View {
        Text(LocalizedStringKey("phoneNumberEnter"))
            .foregroundStyle(Color.white)
            .font(.system(size: 16))
            .padding(.bottom, 32)
            .padding(.horizontal, 24)
    }
    
    var askThePinCodeButton: some View {
        NavigationLink {
            PinCodeView(phone: phone, timer: timer)
        } label: {
            Text(LocalizedStringKey("askTheCode"))
        }
        .disabled(!(phone.count == 10))
        .buttonStyle(WBButtonStyle())
    }
}

#Preview {
    PhoneInputView()
}
