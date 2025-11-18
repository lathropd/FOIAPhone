//
//  LoginViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
import PocketBase


class LoginViewModel: Observable {
    var email: String = ""
    var password: String = ""
    var user: User? = nil
    var pb: PocketBase
    
    init(pb: PocketBase) {
        self.pb = pb
    }
    
    var signedIn: Bool {
        return pb.isAuthenticated
    }
    
    
    
    enum ErrorState {
        case none
        case failedLogin
        case failedAccountCreation
        case networkError
    }
    
    var errorState: ErrorState = .none
    
    
    var messageText: String {
        switch errorState {
        case .none:
            return ""
        case .failedLogin:
            return "The e-mail or password entered was incorrect. Please try again or create a new account."
        case .failedAccountCreation:
            return "Something went wrong with account creation. You may already have an account."
        case .networkError:
            return "There was a problem connecting to the network"
        }
    }
    var messageTitle: String {
        switch errorState {
        case .none:
            return ""
        case .failedLogin:
            return "Trouble logging in"
        case .failedAccountCreation:
            return "Trouble creating an account"
        case .networkError:
            return "Netowrk error"
        }
    }
    
    var messageIsPresented: Bool {
        get {
            if  errorState == .none {
                return false
            } else {
                return true
            }
        } set {
            if newValue == false {
                self.errorState = .none
            } else {
                // self.errorState = self.errorState
            }
        }
    }
    
    var dataCount: Int = 0

    func login() async {
       
               print("Starting update. Current count: \(dataCount)")

               // Simulate a network or database call delay
               try? await Task.sleep(nanoseconds: 1_000_000_000)

               // After the await point, the function resumes and modifies 'dataCount'
               self.dataCount = 42
               print("Update complete. New count: \(dataCount)")
           }

    
}
