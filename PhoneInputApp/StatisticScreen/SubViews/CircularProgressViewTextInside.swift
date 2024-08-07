//
//  CircularProgressViewTextInside.swift
//  PhoneInputApp
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI


struct CircularProgressViewTextInside: View {
    
    init(progress: Double, color: Color, title: String, value: String) {
        self.progress = progress
        self.color = color
        self.title = title
        self.value = value
    }
    
    
    let progress: Double
    let color: Color
    let title: String
    let value: String
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: 5
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-45))
                .animation(.easeOut, value: progress)
            VStack {
                Text(title)
                Text(value)
                
            }
            .font(.subheadline)
            .foregroundStyle(Color.white)
        }
    }
}

