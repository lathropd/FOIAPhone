//
//  FOIAPhoneApp.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//

import SwiftUI
import PocketBase

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


// TODO: Figure out a better place for this
private struct PB: EnvironmentKey {
  // try to run off the local database unless we do something else
  static let defaultValue = PocketBase(baseURL: "http://127.0.0.1:8090")
}


extension EnvironmentValues {
  var pocketBase: PocketBase {
    get {
      self[PB.self]
    } set {
      self[PB.self] = newValue
    }
  }
}
