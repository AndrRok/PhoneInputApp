//
//  ButtonStyles.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/1/24.
//

import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration
                .label
                .frame(maxWidth: .infinity, maxHeight: 48)
                .foregroundStyle(foregroundColor)
                .font(.system(size: 16, weight: .medium))
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

