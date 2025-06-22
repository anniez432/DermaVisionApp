//
//  WelcomeView.swift
//  DermaVision
//
//  Created by Annie Z on 6/21/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var started = false
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
                Button("Let's go!"){
                    started = true
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .font(Font.custom("SansSerif", size: 20))
            }
        }
    }
}

#Preview {
    WelcomeView()
}

