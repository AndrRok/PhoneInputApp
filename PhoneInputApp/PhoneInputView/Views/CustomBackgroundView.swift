//
//  CustomBackgroundView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/5/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        Image(.purpleBackground)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 50)
            .scaleEffect(3)
    }
}

#Preview {
    CustomBackgroundView()
}

struct CustomBackgroundGradient: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 28)
            .foregroundStyle(
                LinearGradient(gradient: Gradient(colors: [.purpleGradietnFirst, .purpleGradietnSecond]), startPoint: .top, endPoint: .bottom)
            )
    }
}

#Preview {
    CustomBackgroundGradient()
}
