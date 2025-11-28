//
//  SettingsViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
 

@Observable
class SettingsViewModel: Observable {
    // always going to make this private and expose via a read-only
    // property when necessary
    private var model: User? = nil
    
    
    // pocketbase object props don't bubble up through observable
    var isAuthenticated: Bool = false
    

    var isMedia: Bool = true
    var isNonprofit: Bool = false
    var isAcademic: Bool = false
    var isPolitical: Bool = false
    var isPrivacyAct: Bool = false
    var isLitigation: Bool = false
    

    // user accessible
    var email = ""
    var fname = ""
    var lname = ""
    var mi = ""
    var title = ""
    var organization = ""
    var description = ""
    var signature = ""
    var userToken = ""
    var isNew: Bool = false
    var userId: String = ""
    var savedSettings: [String: String]
   
    var user: User?
    
    
    

    var settingsAreValid: Bool {
        return true
    }
    
    var settingsAreSaved: Bool {
        return true
    }
    

    


    
     
    init() {
//        self.pb = pb
        self.savedSettings = UserDefaults.standard.dictionary(forKey: "foiaPhoneSettings") as? [String: String] ?? [:]
        self.isAuthenticated = false
//        self.userId = pb.currentUserId ?? ""
        if self.isAuthenticated {
            Task {
//                self.user = try? await pb.collection("Users").getOne(id: pb.currentUserId ?? "")
//                if self.user != nil {
//                    self.email = self.user?.email ?? ""
//                }
            }
            print(self.email)

        }
        print(self.email)
    }
    
    func updateAuthentication() {
//        self.isAuthenticated = pb.isAuthenticated
//        self.userId = pb.currentUserId ?? ""
    }
    
    func saveSettings() {
        self.updateAuthentication()
        self.savedSettings = UserDefaults.standard.dictionary(forKey: "foiaPhoneSettings") as? [String: String] ?? [:]
        self.updateAuthentication()
        self.savedSettings["email"]         = self.email
        self.savedSettings["fname"]         = self.fname
        self.savedSettings["lname"]         = self.lname
        self.savedSettings["mi"]            = self.mi
        self.savedSettings["title"]         = self.title
        self.savedSettings["organization"]  = self.organization
        self.savedSettings["description"]   = self.description
        self.savedSettings["signature"]     = self.signature
        self.savedSettings["userToken"]     = self.userToken
        self.savedSettings["userId"]        = self.userId
        UserDefaults.standard.set(self.savedSettings, forKey: "foiaPhoneSettings")
        print("settings saved")

        
    }
    
    func loadSettings() {
        self.savedSettings = UserDefaults.standard.dictionary(forKey: "foiaPhoneSettings") as? [String: String] ?? [:]
        self.updateAuthentication()
        
        self.email          = self.user?.email ?? self.savedSettings["email"] ?? self.email
        self.fname          = self.savedSettings["fname"]           ?? self.fname
        self.lname          = self.savedSettings["lname"]           ?? self.lname
        self.mi             = self.savedSettings["mi"]              ?? self.mi
        self.title          = self.savedSettings["title"]           ?? self.title
        self.organization   = self.savedSettings["organization"]    ?? self.organization
        self.description    = self.savedSettings["description"]     ?? self.description
        self.signature      = self.savedSettings["signature"]       ?? self.signature
        self.userToken      = self.savedSettings["userToken"]       ?? self.userToken
        self.userId         = self.savedSettings["userId"]          ?? self.userId
        print("settings loaded")
        print("email: \(self.email)")
        
    }
    
    
    
}
