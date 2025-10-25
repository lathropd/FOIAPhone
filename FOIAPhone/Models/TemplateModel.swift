//
//  TemplateModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Foundation

protocol TemplateModelProtocol: Hashable, Codable, Decodable {
    var id: UUID {get}
}

extension TemplateModelProtocol {

}

class Template: TemplateModelProtocol {
    let id: UUID
    
    init(id: UUID?) {
        self.id = id ?? UUID()
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: Template, rhs: Template) -> Bool {
        return lhs === rhs
    }
    
    
}

