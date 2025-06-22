//
//  DermaVisionApp.swift
//  DermaVision
//
//  Created by Annie Z on 6/20/25.
//

import SwiftUI

@main
struct DermaVisionApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.font, .system(.body, design: .serif))
        }
    }
}


