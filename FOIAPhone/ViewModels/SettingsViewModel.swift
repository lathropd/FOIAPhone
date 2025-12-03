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
    var data: User
    var fp: FPAppData
    
    
    
    

    var settingsAreValid: Bool {
        return true
    }
    
    var settingsAreSaved: Bool {
        return true
    }
    

    
    func save() {
        print("SAVE")
        try? fp.db.write { db in
            try self.data.upsert(db)
        }
    }


    
     
    init(fp: FPAppData) {
        let newUser = User(
            id: -1,
            fname: "",
            mi: "",
            lname: "",
            email: "",
            method: "",
            verified: false,
            organization: "",
            title: "",
            signature: "",
            description: "",
            media: false,
            nonprofit: false,
            academic: false,
            political: false,
            privacyAct: false,
            litigant: false,
            created: Date(),
            updated: Date()
        )
        
        var user = try? fp.db.read { db in
            try User.fetchOne(db, key: -1)
        } ?? newUser
        
        
        print("\n\n\n\n===========================\n\n\n\n")
        print("load user")
        user?.verified = true
        
        print(user)
        print("\n\n\n\n===========================\n\n\n\n")

        
        self.fp = fp
        self.data = user ?? newUser
        self.save()
     
    }
    

  
    
    
    
}
