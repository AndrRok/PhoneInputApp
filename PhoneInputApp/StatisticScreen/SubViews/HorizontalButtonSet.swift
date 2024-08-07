//
//  HorizontalButtonSet.swift
//  PhoneInputApp
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI

struct HorizontalButtonSet: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("Статистика")
            }
            Spacer()
            Button {
                
            } label: {
                HStack {
                    Image(.sliders)
                    Text("Отображение виджетов")
                }
            }
            Button {
                
            } label: {
                HStack {
                    Image(.share2)
                    Text("Поделиться")
                }
            }
        }
        .foregroundStyle(Color.white)
        .padding(.horizontal, 20)
    }
}

#Preview {
    HorizontalButtonSet()
}
