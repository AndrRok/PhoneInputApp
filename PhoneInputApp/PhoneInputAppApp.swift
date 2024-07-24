//
//  PhoneInputAppApp.swift
//  PhoneInputApp
//
//  Created by ARMBP on 6/30/24.
//

import SwiftUI

@main
struct PhoneInputAppApp: App {
    @State private var language = Locale.current.language.languageCode?.identifier
    var body: some Scene {
        WindowGroup {
            PhoneInputView()
                .safeAreaInset(edge: .bottom) {
                    Button {
                        if language == "en" {
                            language = "ru"
                        } else {
                            language = "en"
                        }
                    } label: {
                        Image(systemName: "globe")
                    }
                }
                .safeAreaInset(edge: .top) {
                    DatesView()
                }
        }
        .environment(\.locale, .init(identifier: language ?? "en"))
    }
}
