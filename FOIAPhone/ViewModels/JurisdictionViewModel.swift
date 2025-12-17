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
    var data: Jurisdiction
        
    var fp: FPAppData
    
    var jurisdiction: Jurisdiction {
        return self.data
    }
    
    func save() {
        Task {
            try! fp.db.write { db in
                try! self.data.upsert(db)
            }
        }
    }

    func delete() {
        Task {
            try! fp.db.write { db in
                try! self.data.delete(db)
            }
        }
    }
    
    
    init(jurisdiction: Jurisdiction? = nil, fp: FPAppData) {
        self.data = jurisdiction ?? Jurisdiction(id: nil,
                                                 name: "",
                                                 lawName: "",
                                                 created: Date(),
                                                 updated: Date())
        self.fp = fp
    }
}
