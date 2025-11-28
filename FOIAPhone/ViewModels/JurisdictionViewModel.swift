//
//  JurisdictionViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//
import Foundation
 
class JurisdictionViewModel: Observable {
    // always going to make t private and expose via a read-only
    // property when necessary
    private var data: Jurisdiction?
    var db: FPDatabase
    
    var jurisdiction: Jurisdiction? {
        return self.data
    }
    
    private func deleteJurisdiction(request: Jurisdiction) -> String {
        return "Delete"
    }
    
    func deleteJurisdiction(id: String) throws  -> String {
        
        return "Delete"
    }
    
    init(jurisdiction: Jurisdiction?, db: FPDatabase) {
        self.data = jurisdiction
        self.db = db
    }
}
