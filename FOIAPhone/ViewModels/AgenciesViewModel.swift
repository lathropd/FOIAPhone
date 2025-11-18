//
//  AgenciesViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
import PocketBase

class AgenciesViewModel: Observable {
    // always going to make this private and expose via a read-only
    // property when necessary
    var model: [Agency] = []
    
    // rght not this can't be edited because there is no
    // setter. To allow edits add a setter or a mutator functions.
    var agencies: [Agency] {
        return self.model
    }
    
    var jurisdictions: [Jurisdiction] {
        return []
    }
    
    func delete(agency: Agency) {
        self.delete(id: agency.id)
    }
    
    func delete(id: String) {
        // CRUD Logic
    }
    
    func delete(jurisdiction: Jurisdiction) {
        self.delete(jurisdictionId: jurisdiction.id)
    }
    
    func delete(jurisdictionId: String) {
        // CRUD Logic
    }


}
