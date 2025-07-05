//
//  MainContainerView.swift
//  DermaVision
//
//  Created by Annie Z on 6/21/25.
//

import SwiftUI

struct MainContainerView: View {
    @State private var currentPage: Page = .HowItWorks
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0){
            
            CustomNavBar(currentPage: $currentPage)
                .padding(.horizontal, 20)  // padding inside color
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.94, green: 0.97, blue: 1.0)
                    .ignoresSafeArea(edges: .top)).shadow(radius: 4)
            
            //Spacer(minLength: 10)
            //Divider()
            
            ZStack {
                Color(red: 0.94, green: 0.97, blue: 1.0)
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        switch currentPage{
                        case .HowItWorks: HowItWorksView()
                        case .SkinAnalysis: SkinAnalysisView()
                        case .ProfessionalGuidance: ProfessionalGuidanceView()
                        case .AboutUs: AboutUsView()
                        }
                    }
                }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 4)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    
        }    }
}

enum Page: String, CaseIterable{
    case HowItWorks = "How It Works"
    case SkinAnalysis = "Skin Analysis"
    case ProfessionalGuidance = "Guidance"
    case AboutUs = "About Us"
}
