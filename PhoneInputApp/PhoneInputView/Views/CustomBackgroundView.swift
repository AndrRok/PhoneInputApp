//
//  CustomBackgroundView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/5/24.
//

import SwiftUI

struct CustomBackgroundImage: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background {
                Image(.purpleBackground)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)
                    .scaleEffect(3)
            }
    }
}

struct CustomBackgroundGradient: ViewModifier {
    var corners: UIRectCorner = .allCorners
    
    func body(content: Content) -> some View {
        content
            .background {
                Rectangle()
                .clipShape(RoundedCorner(radius: 44, corners: corners))
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [.purpleGradietnFirst, .purpleGradietnSecond]), startPoint: .top, endPoint: .bottom)
                    )
                    .ignoresSafeArea(.all)
                    .opacity(0.8)
            }
    }
}

struct CustomBackgroundLightGradient: ViewModifier {
    var corners: UIRectCorner = .allCorners
    
    func body(content: Content) -> some View {
        content
            .background {
                Rectangle()
                    .clipShape(RoundedCorner(radius: 44, corners: corners))
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [.lightPurpleGradientFirst, .lightPurpleGradientSecond]), startPoint: .top, endPoint: .bottom)
                    )
                    .ignoresSafeArea()
            }
    }
}

extension View {
    func customBackgroundGradient(corners: UIRectCorner = .allCorners) -> some View {
        self.modifier(CustomBackgroundGradient(corners: corners))
    }
    
    func customBackgroundImage() -> some View {
        self.modifier(CustomBackgroundImage())
    }
    
    func customBackgroundLightGradient(corners: UIRectCorner = .allCorners) -> some View {
        self.modifier(CustomBackgroundLightGradient(corners: corners))
    }
}
