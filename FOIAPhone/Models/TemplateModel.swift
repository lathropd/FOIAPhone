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

struct Template: TemplateModelProtocol {
    let id: UUID
    
    init(id: UUID?) {
        self.id = id ?? UUID()
    }
    
}

