//
//  RequestModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Contacts
import Foundation

enum RequestMethod: Decodable, Encodable {
    case web
    case email
    case letter
    case other
}

protocol RequestModelProtocol: Hashable, Codable, Decodable {
    var id: UUID { get }
    var created: Date { get set }
    var agency: Agency? { get set }
    var template: Template? { get set }
    var contact: String {get set}
    var contactEmail: String { get set }
    var contactPhone: String { get set }
    var contactWeb: String { get set }
    var notes: AttributedString { get set }
    var text: AttributedString { get set }
    var method: RequestMethod { get set }
}

extension RequestModelProtocol {

}

class Request: RequestModelProtocol {

    let id: UUID
    var created: Date
    var agency: Agency?
    var template: Template?
    var contact: String
    var contactEmail: String
    var contactPhone: String
    var contactWeb: String
    var notes: AttributedString
    var text: AttributedString
    var method: RequestMethod

    init(
        id: UUID?,
        created: Date? = nil,
        agency: Agency? = nil,
        template: Template? = nil,
        contact: String = "",
        contactEmail: String = "",
        contactPhone: String = "",
        contactWeb: String = "",
        notes: AttributedString = "",
        text: AttributedString = "",
        method: RequestMethod = .email
    ) {
        self.id = id ?? UUID()
        self.created = created ?? Date()
        self.agency = agency
        self.template = template
        self.contact = contact
        self.contactEmail = contactEmail
        self.contactPhone = contactPhone
        self.contactWeb = contactWeb
        self.notes = notes
        self.text = text
        self.method = method

    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: Request, rhs: Request) -> Bool {
        return lhs === rhs
    }
    

}
