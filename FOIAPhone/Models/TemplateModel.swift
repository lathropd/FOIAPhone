//
//  TemplateModel.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import Foundation
import SwiftData

protocol TemplateModelProtocol: FPModelProtocol {
    var name: String {get set}
    var jurisdictions: [Jurisdiction] { get set }
}

extension TemplateModelProtocol {

}

@Model
class Template: TemplateModelProtocol  {
    var name: String
    var jurisdictions: [Jurisdiction]
    
    init(name: String = "", jurisdictions: [Jurisdiction] = []) {
        self.name = name
        self.jurisdictions = jurisdictions
    }
    
//    public func hash(into hasher: inout Hasher) {
//         hasher.combine(ObjectIdentifier(self))
//    }
//    
//    static func == (lhs: Template, rhs: Template) -> Bool {
//        return lhs === rhs
//    }
    
    
}

