//
//  SettingsViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
import PocketBase


class SettingsViewModel: Observable {
    // always going to make this private and expose via a read-only
    // property when necessary
    private var model: User? = nil
    
    var userName = ""
    var userAccount = ""
    var userId = ""
    var isMedia: Bool = true
    var isNonprofit: Bool = false
    var isAcademic: Bool = false
    var isPolitical: Bool = false
    var isPrivacyAct: Bool = false
    var isLitigation: Bool = false

    var email = "Log in to save data"
    var fname = ""
    var lname = ""
    var mi = ""
    var title = ""
    var organization = ""
    var description = "Organization description"
    var signature = "Email Signature"
    var userToken = ""
    var isNew: Bool = false


    var settingsAreValid: Bool {
        return true
    }
    
    var settingsAreSaved: Bool {
        return true
    }
    
    var descriptionIsSet: Bool {
        if self.description == "Organization description" {
            return false
        } else {
            return true
        }

    }
    
    var signatureIsSet: Bool {
        if self.signature == "Email Signature" {
            return false
        } else {
            return true
        }

        
    }
     
    
    
    
}
