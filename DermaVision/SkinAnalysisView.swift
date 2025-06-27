//
//  SkinAnalysisView.swift
//  DermaVision
//
//  Created by Annie Z on 6/21/25.
//

import SwiftUI

struct SkinAnalysisView: View {
    var body: some View {
        VStack{
            Text("Start Your Skin Analysis")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.1, green: 0.25, blue: 0.6))
            Text("Use the webcam or upload an image to analyze your skin.")
        }
        .navigationTitle("Skin Analysis")
    }
}

#Preview{
    WelcomeView()
}
