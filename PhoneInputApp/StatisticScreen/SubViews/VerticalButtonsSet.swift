//
//  VerticalButtonsSet.swift
//  PhoneInputApp
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI

struct VerticalButtonsSet: View {
    var body: some View {
        VStack {
            Image(.avatar)
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .padding(.bottom, 16)
                .padding(.horizontal, 24)
            
            VStack(spacing: 60) {
                Spacer()
                Button{
                    
                } label: {
                    Image(.verticalLines)
                        .padding(12)
                        .customBackgroundLightGradient()
                }
                
                Button{
                    
                } label: {
                    Image(.chat)
                }
                
                Button{
                    
                } label: {
                    Image(.fire)
                }
                Button{
                    
                } label: {
                    Image(.calendar)
                }
                
                Button{
                    
                } label: {
                    Image(.settingsGear)
                }
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 26))
                        .padding(20)
                        .background {
                            Circle()
                                .frame(width: 64, height: 64)
                                .foregroundStyle(Color.white.opacity(0.08))
                            
                        }
                }
            }
            .frame(alignment: .center)
            
        }
        .frame(maxHeight: .infinity)
        .customBackgroundGradient(corners: [.topRight, .bottomRight])
    }
}

#Preview {
    VerticalButtonsSet()
}
