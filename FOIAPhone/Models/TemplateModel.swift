//
//  TemplateModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Foundation

protocol TemplateModelProtocol: Hashable, Codable, Decodable, Identifiable, Observable {
    var id: UUID {get}
    var name: String {get set}
}

extension TemplateModelProtocol {

}

class Template: TemplateModelProtocol {
    let id: UUID
    var name: String
    
    init(id: UUID? = nil, name: String = "") {
        self.id = id ?? UUID()
        self.name = name
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: Template, rhs: Template) -> Bool {
        return lhs === rhs
    }
    
    
}

