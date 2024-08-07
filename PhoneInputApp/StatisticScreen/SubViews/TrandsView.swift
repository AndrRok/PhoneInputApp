//
//  TrandsView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI

struct TrandsView: View {
    var body: some View {
        VStack {
            
            Text("Движение тренда в 2024")
                .foregroundStyle(Color.white)
                .padding(.bottom, 40)
            HStack(alignment: .bottom) {
                ForEach((1...10), id: \.self) { value in
                    VStack {
                        Rectangle()
                            .frame(width: 6, height: CGFloat.random(in: 0..<100))
                            .foregroundStyle(Color.white)
                        Text("0\(value)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(Color.gray)
                    }
                }
            }
            Text("Статистика за 09 месяц")
                .foregroundStyle(Color.white)
            
            HStack(spacing: 20) {
                VStack(spacing: 20) {
                    CircularProgressView(progress: 0.5, color: Color.lightPurpleGradientSecond, image: .calendar, title: "Цена", value: "869")
                        .frame(width: 150, height: 50)
                    CircularProgressView(progress: 0.1, color: Color.lightPurpleGradientSecond, image: .calendar, title: "Цена", value: "869")
                        .frame(width: 150, height: 50)
                }
                
                VStack(spacing: 20) {
                    CircularProgressView(progress: 0.3, color: Color.lightPurpleGradientSecond, image: .calendar, title: "Цена", value: "869")
                        .frame(width: 150, height: 50)
                    CircularProgressView(progress: 0.9, color: Color.lightPurpleGradientSecond, image: .calendar, title: "Цена", value: "869")
                        .frame(width: 150, height: 50)
                }
            }
            .padding(.bottom, 20)
            
            ScrollView {
                ForEach((1...10), id: \.self) { value in
                    HStack {
                        Image(.avatar)
                            .resizable()
                            .frame(maxWidth: 40, maxHeight: 40)
                            .padding(.bottom, 16)
                        VStack(alignment: .leading) {
                            Text("Name")
                                .foregroundStyle(Color.white)
                            Text("Company")
                                .foregroundStyle(Color.gray)
                        }
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.white)
                    }
                    .frame(maxWidth: 280)
                    .multilineTextAlignment(.leading)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .foregroundStyle( Color.white.opacity(0.04))
                    )
                    
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 20)
        .customBackgroundGradient(corners: [.topLeft, .bottomLeft])
    }
}

#Preview {
    TrandsView()
}
