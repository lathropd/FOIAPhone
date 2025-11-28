//
//  User.swift
//  FOIAPhone
//
//  Created by me on 11/11/25.
//


import Foundation
import GRDB
/// The User  struct.
///
struct User: FPRecord  {
    
    
    var id: Int32?
    var name: String
    var email: String
    var avatar: String
    var method: String
    var verified: Bool
    
    var created: Date
    var updated: Date
    
    
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let email = Column(CodingKeys.email)
        static let method = Column(CodingKeys.method)
        static let avatar = Column(CodingKeys.avatar)
        static let verified = Column(CodingKeys.verified)
        
        
        
        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)
        
        
    }
    
    static let requests = hasMany(Request.self)

    
}

