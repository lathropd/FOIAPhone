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
    // @State var appData = TestData.shared    // for dev purposes we'll just use
                                            // our test data
    
    
    var body: some Scene {
        WindowGroup {
            if activeView == .nav {
                MainMenuView(data: appData)
            }
                .modelContainer(for: [Agency.self, Jurisdiction.self, Request.self, Template.self])
        }.environment()
    }
}





