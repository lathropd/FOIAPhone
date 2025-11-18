//
//  MainMenuViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
import PocketBase

class MainMenuViewModel: Observable {
    var pb: PocketBase
    
    init(pb: PocketBase) {
        self.pb = pb
    }
    
    var signedIn: Bool {
        return pb.isAuthenticated
    }
    
    var showLoginScreen: Bool {
        get {
            return self.signedIn == false
        } set {
            print(newValue)
        }
    }
}
