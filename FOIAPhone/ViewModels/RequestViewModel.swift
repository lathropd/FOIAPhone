//
//  RequestViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/6/25.
//
// Can I refactor this to a ViewState? Probably yes.

import Foundation
 

@Observable
class RequestViewModel {
    
    
    var fp: FPAppData
    
    var data: Request
    
    
    public var jurisdictionId: String = ""
    
    
    public var agencyList: [Agency]  = []
    
    public var letterIsLoading: Bool = false
    
    public var alertShows: Bool = false
    public var alertText: String = ""
    public var alertTitle: String = ""
    //    public var user: User
    
    
    
    
    
    
    // variables to shaddow request
    // change this to a dictionary?
    
    
    
    
    var saveable: Bool {
        switch true {
        case self.data.title == "" : return false
        case self.data.status == "": return false
        case self.data.method == "": return false
            //case self.data.agencyId == nil: return false
        default: return true
        }
    }
    
    var saved: Bool {
        self.data.id != nil
    }
    
    var deletable: Bool {
        self.saved
    }
    
    var emailable: Bool {
        return (self.data.text != "")
    }
    
    var navTitle: String {
        return ( self.saved ? "Request" : "New Request" )
    }
    
    var agencyInfo: String {
        let t = """
                Agency Name\nContact Name: \("First Last")
                \("Title")
                \("(206) 555-1212")
                \("user@domain.ext")
                Jurisdiction: \("USA")
                """
        return t
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
    
    func email() {
        print("send email")
    }
    
    func generateLetter() async {
        do {
            let llm = try LLMService()
            self.letterIsLoading = true
            let request = try await llm.generateResponseFromData(data: self.data.records, template: "string.template")
            self.data.text = request.text
            self.letterIsLoading = false
        } catch {
            print("\(error)")
            self.alertTitle = "Network Error"
            self.alertText = """
                            So, something went wrong on the Internet. It could be bad connection, it could be \
                            qsomething else. If this keeps happening, please e-mail [support@foiaphone.app](mailto:support@foiaphone.app).
                            """
            self.alertShows = true
            self.letterIsLoading = false
            
        }
        
        
        
        
    }
    
    
    init(request: Request? = nil, agencyId: String? = nil, jurisdictionId: String? = nil, fp: FPAppData) {
            self.data = request ?? Request(
                id: nil,
                title: "",
                records: "",
                text: "",
                method: "",
                status: "",
                notes: "",
                sent: Date(),
                agencyId: -1,
                userId: -1,
                created: Date(),
                updated: Date()
            )
           

    
    
        
    
        
        if jurisdictionId != nil {
            self.jurisdictionId = jurisdictionId ?? ""
            //
        } else if request?.agencyId != nil {
            
        }
        
        
        self.fp = fp

       
        
    }
}
