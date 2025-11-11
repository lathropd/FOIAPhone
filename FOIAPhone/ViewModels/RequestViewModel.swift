//
//  RequestViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/6/25.
//

import Foundation
import GRDB

@Observable @MainActor final class RequestViewModel {
    
    private let appDatabase: AppDatabase
    private var request: Request
    private var agency: Agency?
    private var jurisdiction: Jurisdiction?
    private var template: Template?
    
    
    // public variables
    var jurisdictionId: Int64?

    // variables to shaddow request
    // change this to a dictionary?
    var agencyId: Int64?
    var sentDate: Date = Date()
    var name: String = ""
    var text: String = ""
    var records: String = ""
    var method: String = ""
    var status: String = ""
    var notes: String = ""
    var templateId: Int64?
    
    
    
    var saveable: Bool {
        switch true {
        case self.name == "" : return false
        case self.status == "": return false
        case self.method == "": return false
        case self.agencyId == nil: return false
        default: return true
        }
    }
    
    var saved: Bool {
        request.id != nil
    }
    
    var deletable: Bool {
        self.saved
    }
    
    var emailable: Bool {
        return (self.text != "")
    }
    
    let navTitle = "New Request"
    
    var agencyInfo: String {
        return """
Agency Name\nContact Name: \("First Last")
\("Title")
\("(206) 555-1212")
\("user@domain.ext")
Jurisdiction: \("USA")
"""
    }
    
    func save() {
        print("save")
    }
    
    func delete() {
        print("delete")
    }

    func email() {
        print("send email")
    }
    
    func generateLetter() {
        print("generate a request letter")
    }


    init(appDatabase: AppDatabase, request: Request? = nil, agency: Agency? = nil, jurisdiction: Jurisdiction? = nil, template: Template? = nil) {
        self.appDatabase = appDatabase
        self.request = request ?? Request(name: "",
                                          records: "",
                                          text: "",
                                          method: "",
                                          status: "draft",
                                          notes: "")
        
        if request?.agencyId != nil {
            _ = request!
            try? appDatabase.reader.read {db in
                self.agency = try? Agency.find(db, id: request?.agencyId  )
                
            }
        } else {
            self.agency = agency
        }
        
        if request?.templateId != nil {
            _ = request!
            try? appDatabase.reader.read {db in
                self.template = try? Template.find(db, id: request?.templateId  )
                
            }
        } else {
            self.template = template
        }
        
        
        if self.agency?.jurisdictionId != nil {
            _ = agency!
            try? appDatabase.reader.read {db in
                self.jurisdiction = try? Jurisdiction.find(db, id: agency?.jurisdictionId  )
                
            }
        } else {
            self.jurisdiction = jurisdiction
        }

        self.template = template
        self.name = request?.name ?? self.name
        self.sentDate = request?.sent ?? Date()
        self.records = request?.records ?? self.records
        self.text = request?.text ?? self.text
        self.status = request?.status ?? self.status
        self.notes = request?.notes ?? self.notes
        self.agencyId = request?.agencyId // we're just going to store an ID
        self.jurisdictionId = self.jurisdiction?.id ?? nil // we're just going to store an ID
        self.templateId = self.template?.id ?? nil  // we're just going to store an ID
        
    }
}
