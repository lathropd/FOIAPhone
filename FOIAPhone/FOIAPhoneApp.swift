//
//  FOIAPhoneApp.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//

import SwiftUI

@main
struct FOIAPhoneApp: App {
    @Environment(\.db) var db: FPDatabase

    var body: some Scene {
        WindowGroup {
            MainMenuView()
            
            
        }
    }
    
    init() {
        // Code to run when the app first launches
        print("App is launching!")
        // Example: Initialize UserDefaults
        
        // migrate if necessary
        do {
            print("running databse migrations")
            try db.migrate()
        } catch {
            print("migrations failed: \(error)")
        }
        
        UserDefaults.standard.register(defaults: ["foiaPhoneSettings": ["":""]])
        
    }
}
