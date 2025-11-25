//
//  LoginViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
 
@Observable
@MainActor
class LoginViewModel: Observable {
    var email: String = ""
    var password: String = ""
    //    var user: User? = nil
    //    var  
    var isAuthenticated: Bool = false
    
    init( ) {
//        self.pb = pb
        self.isAuthenticated = false
        if self.isAuthenticated {
            Task {
                //                self.user = try? await pb.collection("Users").getOne(id: pb.currentUserId ?? "")
                //                if self.user != nil {
                //                    self.email = self.user?.email ?? ""
            }
        }
    }

    
    var signedIn: Bool {
        return self.isAuthenticated
    }
    
    func login()  {
        Task {
            do {
//                _ = try await self.pb.authWithPassword(email: self.email, password: self.password, userType: User.self)
//                self.isAuthenticated = pb.isAuthenticated
//                self.user = try? await pb.collection("Users").getOne(id: pb.currentUserId ?? "")
                    

            } catch {
                print("\(error)")
//                self.isAuthenticated = pb.isAuthenticated
                self.errorState = .failedLogin
            }
        }

    }
    
    func logout() {
//        self.pb.signOut()
//        self.isAuthenticated = pb.isAuthenticated
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
