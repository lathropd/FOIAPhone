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
    var data: Agency
    var fp: FPAppData
    
    var agency: Agency {
        return self.data
    }
    
    var contacts: [Contact] {
        return []
    }
    
    func save() {
        Task {
            try fp.db.write { db in
                try self.data.upsert(db)
            }
        }
    }
            

    func delete() {
        Task {
            try fp.db.write { db in
                try self.data.delete(db)
            }
        }
    }
    
    
    init(agency: Agency? = nil, fp: FPAppData) {
        self.data = agency ?? Agency(id: nil,
                                     name: "",
                                     foiaPortal: "",
                                     website: "",
                                     jurisdictionId: -1,
                                     created: Date(),
                                     updated: Date())
        
        self.fp = fp
    }

    
    
}
