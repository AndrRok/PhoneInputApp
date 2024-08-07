//
//  MarketingSpecialistsView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI

struct MarketingSpecialistsView: View {
    var body: some View {
        ScrollView {
            Text("Маркетинговые специалисты")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            LazyVStack(alignment: .leading) {
                ForEach((1...10), id: \.self) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(Color.white.opacity(0.04))
                        VStack(alignment: .leading) {
                            HStack {
                                Image(.avatar)
                                    .resizable()
                                    .frame(maxWidth: 40, maxHeight: 40)
                                    .padding(.bottom, 16)
            
                                VStack(alignment: .leading) {
                                    Text("Имя")
                                    Text("Должность")
                                    
                                }
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.white)
                                
                                Spacer()
                                
                                HStack {
                                    Image(systemName: "star")
                                    Text("4.6")
                                }
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.white)
                                
                                
                            }
                            
                            HStack {
                                Text("Выполнено продаж: 1 234 / 1 700")
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Text("Выполнено 78%")
                                    .foregroundStyle(Color.white)
                            }
                            
                            
                        }
                        .padding(10)
                    }
                }
            }
        }
        .padding(20)
        .customBackgroundGradient()
    }
}

#Preview {
    MarketingSpecialistsView()
}
