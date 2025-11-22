//
//  RequestViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/6/25.
//
// Can I refactor this to a ViewState? Probably yes.

import Foundation
import PocketBase


@Observable
class RequestViewModel {
    
    public var request: Request
    public var agency: Agency?
    public var jurisdiction: Jurisdiction?
//    public var user: User

    
    

    
    
    // variables to shaddow request
    // change this to a dictionary?
   
    
    
    
    var saveable: Bool {
        switch true {
        case self.request.title == "" : return false
        case self.request.status == "": return false
        case self.request.method == "": return false
        case self.request.agencyId == nil: return false
        default: return true
        }
    }
    
    var saved: Bool {
        self.request.id != nil
    }
    
    var deletable: Bool {
        self.saved
    }
    
    var emailable: Bool {
        return (self.request.text != "")
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
    
    func generateLetter() async {
        do {
            let llm = try LLMService()
            let request = try await llm.generateResponseFromData(data: self.request.records, template: "string.template")
            let letterText = request.text
            print(self.request.text)
            self.request.text = letterText
        } catch {
            print("\(error)")
        }

        
    
        
    }


    init(request: Request? = nil, agency: Agency? = nil, jurisdiction: Jurisdiction? = nil/*, template: Template? = nil*/) {
//        self.appDatabase = appDatabase
        self.request = request ?? Request(
            id: "",
            title: "",
            records: "",
            text: "",
            method: "",
            status: "",
            notes: "",
            sent: Date(),
            agencyId: nil,
            created: "",
            updated: ""
        )
        
        
        if request?.agencyId != nil {
            _ = request!
//            try? appDatabase.reader.read {db in
//                self.agency = try? Agency.find(db, id: request?.agencyId  )
                
//            }
        } else {
            self.agency = agency
        }
        

        
        
        if agency?.jurisdictionId != nil {
//            _ = agency!
//            try? appDatabase.reader.read {db in
//                self.jurisdiction = try? Jurisdiction.find(db, id: agency?.jurisdictionId  )
//                
//            }
        } else {
            self.jurisdiction = jurisdiction
        }

       
        
    }
}
