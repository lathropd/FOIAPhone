//
//  RequestModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Contacts
import Foundation
import SwiftData

enum RequestMethod: String, Codable {
    case web
    case email
    case letter
    case other
}

enum RequestStatus: String, Codable {
    case draft
    case sent
    case overdue
    case acknowledged
    case pending
    case appealed
    case completed
    case denied
}

protocol RequestModelProtocol: FPModelProtocol {
    var title: String { get set }
    var recordsSought: String { get set }
    var created: Date { get set }
    var agency: Agency? { get set }
    var template: Template? { get set }
    var contact: String { get set }
    var contactEmail: String { get set }
    var contactPhone: String { get set }
    var contactWeb: String { get set }
    var notes: String { get set }
    var text: String { get set }
    var method: RequestMethod { get set }
    var status: RequestStatus { get set }
}

extension RequestModelProtocol {

}

@Model
class Request: RequestModelProtocol {

    var title: String
    var recordsSought: String
    var created: Date
    var agency: Agency?
    var template: Template?
    var contact: String
    var contactEmail: String
    var contactPhone: String
    var contactWeb: String
    var notes: String
    var text: String
    var method: RequestMethod
    var status: RequestStatus


    init(
        title: String = "",
        recordsSought: String = "",
        created: Date = Date(),
        agency: Agency? = nil,
        template: Template? = nil,
        contact: String = "",
        contactEmail: String = "",
        contactPhone: String = "",
        contactWeb: String = "",
        notes: String = "",
        text: String = "",
        method: RequestMethod = .email,
        status: RequestStatus = .draft
    ) {
        self.title = title
        self.recordsSought = recordsSought
        self.created = created
        self.agency = agency
        self.template = template
        self.contact = contact
        self.contactEmail = contactEmail
        self.contactPhone = contactPhone
        self.contactWeb = contactWeb
        self.notes = notes
        self.text = text
        self.method = method
        self.status = status

    }
    
    public func generateRequest() {
        
    }
    
    public func emailRequest() {
        
    }

    //    public func hash(into hasher: inout Hasher) {
    //         hasher.combine(ObjectIdentifier(self))
    //    }
    //
    //    static func == (lhs: Request, rhs: Request) -> Bool {
    //        return lhs === rhs
    //    }

}
