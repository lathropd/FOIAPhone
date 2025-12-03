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

    
    var fp: FPAppData
    
    // rght not this can't be edited because there is no
    // setter. To allow edits add a setter or a mutator functions.
    var agencies: [Agency] {
        return self.data
    }
    
  
    
    func delete(agency: Agency) {
        
    }
    
 
    func delete(jurisdiction: Jurisdiction) {

    }
    
    func load()  {
        do {
            try self.fp.db.read { db in
                
                let agencies =  try?  Agency.fetchAll(db, sql: """
                                                            select * 
                                                            from agency where id <> -1;
                                                            """)
                if agencies != nil {
                    self.data = agencies!
                    print("loaded agencies!")

                }
                
                let jurisdictions =  try? Jurisdiction.fetchAll(db, sql: """
                                                            select * 
                                                            from jurisdiction where id <> -1;
                                                            """)
                if jurisdictions != nil {
                    self.jurisdictions = jurisdictions!
                    print("loaded jurisdictions!")

                }

            }
        } catch {
            print("error in AgenciesViewModel\n\(error)")
        }
    }
    
    init(fp: FPAppData) {
        self.fp = fp

    }
    



}
