//
//  MainMenuViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
 
class MainMenuViewModel: Observable {
//    var  
    
    init() {
//        self.pb = pb
    }
    
    var signedIn: Bool {
        return false
    }
    
    var showLoginScreen: Bool {
        get {
            return self.signedIn == false
        } set {
            print(newValue)
        }
    }
}
