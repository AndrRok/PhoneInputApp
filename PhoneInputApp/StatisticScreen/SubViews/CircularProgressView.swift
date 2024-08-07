//
//  CircularProgressView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI


struct CircularProgressView: View {
    
    init(progress: Double, color: Color, image: ImageResource, title: String, value: String) {
        self.progress = progress
        self.color = color
        self.image = image
        self.title = title
        self.value = value
    }
    
    
    let progress: Double
    let color: Color
    let image: ImageResource
    let title: String
    let value: String
    
    var body: some View {
        HStack {
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
                
                Image(image)
            }
            VStack {
                Text(title)
                Text(value)
                
            }
            .foregroundStyle(Color.white)
        }
    }
}
