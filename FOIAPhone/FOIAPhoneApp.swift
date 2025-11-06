//
//  FOIAPhoneApp.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//

import SwiftUI

@main
struct FOIAPhoneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .appDatabase(.shared)
        }
    }
}

// MARK: - Give SwiftUI access to the database

extension EnvironmentValues {
    @Entry var appDatabase = AppDatabase.empty()
}

extension View {
    func appDatabase(_ appDatabase: AppDatabase) -> some View {
        self.environment(\.appDatabase, appDatabase)
    }
}
