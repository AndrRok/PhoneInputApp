//
//  DatesView.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/24/24.
//

import SwiftUI

struct DatesView: View {
    @State private var date = Date()
    @Environment(\.locale) private var locale: Locale
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Короткий формат: \(date, formatter: dateFormatter(.short))")
            Text("Средний формат: \(date, formatter: dateFormatter(.medium))")
            Text("Длинный формат: \(date, formatter: dateFormatter(.long))")
            Text(distanceString(meters: 1000))
        }
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.date = Date()
            }
        })
    }
    
    private func dateFormatter(_ style: DateFormatter.Style) -> DateFormatter {//локализация даты
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = style
        formatter.locale = Locale.current
        return formatter
    }
    
    private func distanceString(meters: Double) -> String {//Локализация дистанции
        switch locale.language.languageCode?.identifier == "ru" {
            case true:
                return String(Measurement(value: meters, unit: UnitLength.meters).converted(to: UnitLength.kilometers).value) + " km"
            default:
                return String(Measurement(value: meters, unit: UnitLength.meters).converted(to: UnitLength.miles).value) + " miles"
        }
    }
}

#Preview {
    DatesView()
}
