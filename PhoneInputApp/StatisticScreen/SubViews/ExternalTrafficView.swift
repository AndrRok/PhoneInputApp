//
//  ExternalTrafficView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI

struct ExternalTrafficView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Внешний трафик")
                    Text("Май 2024")
                    Image(systemName: "chevron.down")
                }
                .foregroundStyle(Color.white)
                HStack {
                    Text("1")
                    Text("2")
                }
                
                HStack {
                    
                    CircularProgressViewTextInside(progress: 0.5, color: Color.purple, title: "От всех покупок", value: "78%")
                        .frame(maxWidth: 180, maxHeight: 180)
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("445 чел")
                            Text("Новые клиенты")
                                .foregroundStyle(Color.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundStyle(Color.white.opacity(0.04))
                            
                        )
                        
                        VStack(alignment: .leading) {
                            Text("4511 чел")
                            Text("Всего с внешнего трафика")
                                .foregroundStyle(Color.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundStyle(Color.white.opacity(0.04))
                            
                        )
                    }
                }
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.white)
            }
            .padding(20)
            .customBackgroundGradient()
            
            Text("ИИ в техподдержке")
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .center)
                .foregroundStyle(Color.white)
                .padding(20)
                .padding(.bottom, 50)
                .background(
                    Image(.blueBackground)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                )
                .padding(.vertical, 20)
        }
    }
}

#Preview {
    ExternalTrafficView()
}
