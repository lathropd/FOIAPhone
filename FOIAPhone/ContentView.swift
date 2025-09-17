//
//  ContentView.swift
//  FOIAPhone
//
//  Created by me on 9/17/25.
//

import SwiftUI

struct ContentView: View {
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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
