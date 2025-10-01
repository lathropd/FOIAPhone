//
//  ContentView.swift
//  FOIAPhone
//
//  Created by me on 9/17/25.
//

import SwiftUI

struct FPSplashContentView: View {
    var appDisplayName = Text("FOIA Phone")
        .font(.largeTitle)

    
    
    var body: some View {

        VStack {
//            Spacer()

            Image("app-logo")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: -30))
                .id("FOIAPhoneAppLogo")
            ProgressView(value: 0.5)
                .progressViewStyle(.circular)
                .padding(EdgeInsets(top: 30, leading: 60,bottom: 10, trailing: 60))
    //                .scaleEffect(4.0 )
                .accessibilityIdentifier("Loading")
            appDisplayName
            
            
            
            
        }
        .padding()
    }
}

#Preview {
    FPSplashContentView()
}
