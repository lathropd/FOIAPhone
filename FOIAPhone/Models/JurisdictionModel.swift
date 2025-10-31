//
//  JurisdictionModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Foundation
import SwiftData

protocol JurisdictionModelProtocol: FPModelProtocol {
    var name: String {get set}
    var parent: Jurisdiction? {get set}
//    var children: [Jurisdiction] {get set}
    var agencies: [Agency] { get set}
    var law: String {get set}
    var days: Int {get set}
    var templates: [Template] { get set }
    
    
    
}

extension JurisdictionModelProtocol {


}

@Model
class Jurisdiction: JurisdictionModelProtocol {

    
    var name: String
    var parent: Jurisdiction?
//    var children: [Jurisdiction]
    var agencies: [Agency]
    var law: String
    var days: Int
    var templates: [Template]

    
    init(id: UUID? = nil,
         name: String = "nil",
         parent: Jurisdiction? = nil,
//         children: [Jurisdiction] = [],
         agencies: [Agency] = [],
         law: String = "",
         days: Int = 0,
         templates: [Template] = []) {
        self.name = name
//        self.children = children
        self.agencies = agencies
        self.parent = parent
        self.law = law
        self.days = days
        self.templates = templates
    }
    
//    public func hash(into hasher: inout Hasher) {
//         hasher.combine(ObjectIdentifier(self))
//    }
//    
//    static func == (lhs: Jurisdiction, rhs: Jurisdiction) -> Bool {
//        return lhs === rhs
//    }
//    
    
}
