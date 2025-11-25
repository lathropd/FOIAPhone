//
//  FOIAPhoneApp.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//

import SwiftUI
import PocketBase
import SQLKit
import SQLiteKit


@main
struct FOIAPhoneApp: App {
    @Environment(\.pocketBase) var pb
    var body: some Scene {
        WindowGroup {
            MainMenuView()
            
            
        }
    }
    
    init() {
        // Code to run when the app first launches
        print("App is launching!")
        // Example: Initialize UserDefaults
        UserDefaults.standard.register(defaults: ["foiaPhoneSettings": ["":""]])
    }
}
