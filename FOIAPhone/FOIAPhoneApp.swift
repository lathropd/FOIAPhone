//
//  FOIAPhoneApp.swift
//  FOIAPhone
//
//  Created by me on 9/17/25.
//

import SwiftUI

enum AppView {
    case loading
    case nav
    case settings
}

@main
struct FOIAPhoneApp: App {
    @State var activeView: AppView = .nav
    
    
    var body: some Scene {
        WindowGroup {
            FPSplashContentView()
            
            
        }
    }
}



