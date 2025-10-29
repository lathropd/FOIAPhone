//
//  AgencyModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Foundation
import SwiftData

protocol AgencyModelProtocol: FPModelProtocol {
    var id: UUID { get }
    var name: String { get set }
    // var parentId: UUID? {get set}
    var jurisdiction: Jurisdiction? { get set }
    var days: Int? { get set }
    var contact: String {get set}
    var contactEmail: String { get set }
    var contactPhone: String { get set }
    var contactWeb: String? { get set }

}

extension AgencyModelProtocol {

}

@Model
class Agency: AgencyModelProtocol {
    var id: UUID
    var name: String
    var jurisdiction: Jurisdiction?
    var days: Int?
    var contact: String
    var contactEmail: String
    var contactPhone: String
    var contactWeb: String?
    
    init(
        id: UUID? = nil,
        name: String = "",
        jurisdiction: Jurisdiction? = nil,
        days: Int? = nil,
        contact: String = "",
        contactEmail: String = "",
        contactPhone: String = "",
        contactWeb: String = ""
    ) {
        self.id = id ?? UUID()
        self.name = name
        self.jurisdiction = jurisdiction
        self.days = days
        self.contact = contact
        self.contactEmail = contactEmail
        self.contactPhone = contactPhone
        self.contactWeb = contactWeb
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: Agency, rhs: Agency) -> Bool {
        return lhs === rhs
    }
    

}
