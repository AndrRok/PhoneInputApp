//
//  StatisticScreen.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/31/24.
//

import SwiftUI

struct StatisticScreen: View {
    var body: some View {
        HStack(spacing: 0) {
            VerticalButtonsSet()
            
            VStack(spacing: 20) {
                HorizontalButtonSet()
                
                StatisticView()
                
                HStack(alignment: .top, spacing: 16) {
                    MarketingSpecialistsView()
                    ExternalTrafficView()
                }
                .padding(.horizontal, 20)
            }
            .frame(maxHeight: .infinity)
            
            TrandsView()
            
        }
        .customBackgroundImage()
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    StatisticScreen()
}




