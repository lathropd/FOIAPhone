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

     
    var request: Request
    var fp: FPAppData
    
    public var data: Request

    
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
        case self.request.title == "" : return false
        case self.request.status == "": return false
        case self.request.method == "": return false
        //case self.request.agencyId == nil: return false
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
        if self.request.id == nil {
            Task {
                print("creating new")
                do {
                    print("retrieved new")
                    print("new request created")
                    
                } catch {
                    print("\(error)")
                }
                
                
            }
        } else {
            Task {
                do {
      
                } catch {
                    print("\(error)")
                }
            }
        }

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
            self.letterIsLoading = true
            let request = try await llm.generateResponseFromData(data: self.request.records, template: "string.template")
            self.request.text = request.text
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
        if request != nil {
            self.request = request!
        } else {
            self.request = Request(
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
            
                
            
        }
    
        
    
        
        if jurisdictionId != nil {
            self.jurisdictionId = jurisdictionId ?? ""
            //
        } else if request?.agencyId != nil {
            
        }
        
        
        self.fp = fp
        self.request = request

       
        
    }
}
