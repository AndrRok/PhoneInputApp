//
//  ContentView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 6/30/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var phone: String = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.purpleBackground)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)
                    .scaleEffect(3)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Авторизация")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 24, weight: .semibold))
                        .padding(.bottom, 28)
                        .padding(.top, 40)
                        .padding(.horizontal, 24)
                    
                    Image(.avatar)
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 24)
                    
                    Text("Вход по номеру телефона")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16))
                        .padding(.bottom, 32)
                        .padding(.horizontal, 24)
                    
                    PhoneTextField(phone: $phone)
                        .padding(.bottom, 34)
                    
                    NavigationLink {
                        Text("fff")
                    } label: {
                        Text("Запросить код")
                    }
                    .disabled(!(phone.count == 10))
                    .buttonStyle(DefaultButtonStyle())  
                }
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.purpleGradietnFirst, .purpleGradietnSecond]), startPoint: .top, endPoint: .bottom)
                        )
                    
                )
                .frame(maxWidth: 400)
                
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

#Preview {
    ContentView()
}
