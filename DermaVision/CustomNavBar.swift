//
//  CustomNavBar.swift
//  DermaVision
//
//  Created by Annie Z on 6/21/25.
//

import SwiftUI

struct CustomNavBar: View{
    @Binding var currentPage: Page
    var body: some View{
        VStack(spacing: 12) {
                    // Logo
                    Image("DermaVision") // Replace with your asset name
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)

                    // Title
            Text(currentPage.rawValue)
                        .font(.custom("Georgia", size: 24, relativeTo: .title))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.1, green: 0.25, blue: 0.6))
                        .frame(maxWidth: .infinity, alignment: .center)

                    // Nav Buttons
                    HStack {
                        ForEach(Page.allCases, id: \.self) { page in
                            Button(action: {
                                currentPage = page
                            }) {
                                Text(page.rawValue)
                                    .font(Font.custom("Georgia", size: 14, relativeTo: .body))
                                    .underline(currentPage == page)
                                    .foregroundColor(currentPage == page ? .blue : .primary)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.horizontal, 8)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
    }
    
}

