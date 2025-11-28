//
//  AgencyViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//
import Foundation
 

class AgencyViewModel {
    // always going to make t private and expose via a read-only
    // property when necessary
    private var data: Agency?
    var db: FPDatabase

    var agency: Agency? {
        return self.data
    }
    
    func save() {
        // CRUD LOGIC
    }
            

    func delete() {
        // CRUD LOGIC
    }
    
    init(agency: Agency? = nil, db: FPDatabase) {
        self.data = agency
        self.db = db
    }

    
    
}
