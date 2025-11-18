//
//  LoginViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
import PocketBase

@Observable
@MainActor
class LoginViewModel: Observable {
    var email: String = ""
    var password: String = ""
    var user: User? = nil
    var pb: PocketBase
    var isAuthenticated: Bool = false
    
    init(pb: PocketBase) {
        self.pb = pb
        self.isAuthenticated = pb.isAuthenticated
    }
    
    var signedIn: Bool {
        return self.isAuthenticated
    }
    
    func login()  {
        Task {
            do {
                var authResult = try await self.pb.authWithPassword(email: self.email, password: self.password, userType: User.self)
                self.isAuthenticated = pb.isAuthenticated

            } catch {
                print("\(error)")
                self.isAuthenticated = pb.isAuthenticated
                self.errorState = .failedLogin
            }
        }

    }
    
    func logout() {
        self.pb.signOut()
        self.isAuthenticated = pb.isAuthenticated
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
    


    
}
