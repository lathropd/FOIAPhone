//
//  AgenciesViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
 
class AgenciesViewModel: Observable {
    // always going to make this private and expose via a read-only
    // property when necessary
    var data: [Agency] = []
    var jurisdictions: [Jurisdiction] = []
    var db: FPDatabase
    
    // rght not this can't be edited because there is no
    // setter. To allow edits add a setter or a mutator functions.
    var agencies: [Agency] {
        return self.data
    }
    
  
    
    func delete(agency: Agency) {
        
    }
    
 
    func delete(jurisdiction: Jurisdiction) {

    }
    
    init(db: FPDatabase) {
        self.db = db
    }
    



}
