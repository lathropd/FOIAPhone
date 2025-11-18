//
//  AgencyViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//
import Foundation
import PocketBase


class AgencyViewModel {
    // always going to make t private and expose via a read-only
    // property when necessary
    private var model: Agency? = nil
    
    var agency: Agency? {
        return self.model
    }
    
    func save() {
        // CRUD LOGIC
    }
            

    func delete() {
        // CRUD LOGIC
    }

    
    
}
