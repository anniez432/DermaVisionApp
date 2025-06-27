//
//  WelcomeView.swift
//  DermaVision
//
//  Created by Annie Z on 6/21/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var started = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        if started {
            MainContainerView()
        } else {
            VStack {
                Text("Welcome to DermaVision")
                    .font(Font.custom("Georgia", size: 40))
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? .white : Color(red: 0.1, green: 0.25, blue: 0.6))
                Button("Let's go!"){
                    started = true
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .font(Font.custom("SansSerif", size: 20))
                .tint(colorScheme == .dark ? .white : Color(red: 0.1, green: 0.25, blue: 0.6))
                .foregroundColor(colorScheme == .dark ? Color(red: 0.1, green: 0.25, blue: 0.6) : .white)
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? Color(red: 0.1, green: 0.25, blue: 0.6) : .white)
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    WelcomeView()
}

