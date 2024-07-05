//
//  ButtonStyles.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/1/24.
//

import SwiftUI

struct WBButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration
                .label
                .frame(maxWidth: .infinity)
                .foregroundStyle(foregroundColor)
                .font(.system(size: 16, weight: .medium))
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(backgroundColor)
                )
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .padding(.bottom, 62)
                .padding(.horizontal, 24)
    }
    
    private let foregroundColor: Color = .white
    private let backgroundColor: Color = .purpleBackground
    @Environment(\.isEnabled) private var isEnabled
}

struct TimerButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration
                .label
                .frame(maxWidth: .infinity, maxHeight: 48)
                .foregroundStyle(isEnabled ? foregroundColor : .gray)
                .font(.system(size: 16, weight: .medium))
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                //.padding(.bottom, 62)
                //.padding(.horizontal, 24)
    }
    
    private let foregroundColor: Color = .white
    @Environment(\.isEnabled) private var isEnabled
}

