//
//  PinCodeView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/1/24.
//

import SwiftUI

struct PinCodeView: View {
    
    init(phone: String, timer: PinCodeTimer) {
        self.phone = phone
        self.timer = timer
    }
    
    private let phone: String
    @State private var timer: PinCodeTimer
    @State private var pinCode: String = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                CustomBackgroundView()
                
                VStack(spacing: 24) {
                    VStack(alignment: .center, spacing: 0) {
                        
                        messageImage
                        
                        phoneNumberTitle
                        
                        PinCodeTextfield(pinCode: $pinCode)
                        
                        askThePinCodeButton
                        
                        authorizeButton
                        
                    }
                    .background(
                        CustomBackgroundGradient()
                    )
                    .frame(maxWidth: 400)
                    
                    turnBackButton
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            timer.startTimer()
        }
    }
    
    @Environment(\.dismiss) private var dismiss
}

private extension PinCodeView {
    
    var messageImage: some View {
        Image(.message)
            .padding(.top, 40)
            .padding(.bottom, 16)
            .padding(.horizontal, 24)
    }
    
    var phoneNumberTitle: some View {
        Text(phone.formatPhoneNumber())
            .foregroundStyle(Color.white)
            .font(.system(size: 24, weight: .semibold))
            .padding(.bottom, 32)
            .padding(.horizontal, 24)
    }
    
    var askThePinCodeButton: some View {
        Button {
            timer.resetTimer()
        } label: {
            HStack(spacing: 4) {
                Text(LocalizedStringKey("askTheCodeAgain"))
                Text(String(timer.seconds))
                Text(LocalizedStringKey("secondsShort"))
            }
            .font(.system(size: 14))
        }
        .buttonStyle(TimerButtonStyle())
        .disabled(timer.seconds > 0)
    }
    
    var authorizeButton: some View {
        NavigationLink {
            PinCodeView(phone: phone, timer: timer)
        } label: {
            Text(LocalizedStringKey("authorize"))
        }
        .buttonStyle(WBButtonStyle())
    }
    
    var turnBackButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "chevron.left")
                Text(LocalizedStringKey("turnBack"))
            }
        }
        .foregroundStyle(Color.white)
    }
}

#Preview {
    PinCodeView(phone: "A", timer: PinCodeTimer())
}
