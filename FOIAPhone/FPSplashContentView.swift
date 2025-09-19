//
//  ContentView.swift
//  FOIAPhone
//
//  Created by me on 9/17/25.
//

import SwiftUI

struct FPSplashContentView: View {
    var appDisplayName = Text("\nFOIA\nPhone")
        .font(.largeTitle)
    
    
    var body: some View {
        VStack {
            Image("app-logo")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: -30))

            Text("\nFOIA\nPhone")
                .font(.largeTitle)
                .scaleEffect(1.6)
            
            ProgressView(value: 0.5)
                .progressViewStyle(.circular)
                .padding(EdgeInsets(top: 30, leading: 60,bottom: 10, trailing: 60))
                .scaleEffect(4.0 )
                .accessibilityIdentifier("Loading")
            
            
        }
        .padding()
    }
}

#Preview {
    FPSplashContentView()
}
