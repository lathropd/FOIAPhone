//
//  JurisdictionModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Foundation

protocol JurisdictionModelProtocol: Hashable, Codable, Decodable {
    var id: UUID {get}
    var name: String? {get set}
    var parentId: UUID? {get set}
    var law: String {get set}
    var days: Int {get set}
    
    func parent() -> (any JurisdictionModelProtocol)?
    
    
}

extension JurisdictionModelProtocol {
    func parent() -> (any JurisdictionModelProtocol)? {
        return nil
    }
    

}

class Jurisdiction: JurisdictionModelProtocol {

    
    let id: UUID
    var name: String?
    var parentId: UUID?
    var law: String
    var days: Int
    
    init(id: UUID? = nil,
         name: String? = nil,
         parentId: UUID? = nil,
         law: String = "",
         days: Int = 0) {
        self.id = id ?? UUID()
        self.name = name
        self.parentId = parentId
        self.law = law
        self.days = days
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: Jurisdiction, rhs: Jurisdiction) -> Bool {
        return lhs === rhs
    }
    
    
}
