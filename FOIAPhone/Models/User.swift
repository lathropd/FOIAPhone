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
    var fname: String
    var lname: String
    var email: String
    var avatar: String
    var method: String
    var verified: Bool
    
    
    var organization: String
    var title: String

    var organizationDescription: String
    var media: Bool
    var nonprofit: Bool
    var academic: Bool
    var political: Bool
    var privacyAct: Bool
    var litigant: Bool

    
    var created: Date
    var updated: Date
    
    
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let fname = Column(CodingKeys.fname)
        static let lname = Column(CodingKeys.lname)
        static let email = Column(CodingKeys.email)
        static let method = Column(CodingKeys.method)
        static let avatar = Column(CodingKeys.avatar)
        static let verified = Column(CodingKeys.verified)
        static let organization =  Column(CodingKeys.organization)
        static let title = Column(CodingKeys.title)
        
        static let organizationDescription =  Column(CodingKeys.organizationDescription)
        static let media = Column(CodingKeys.media)
        static let nonprofit = Column(CodingKeys.nonprofit)
        static let academic = Column(CodingKeys.academic)
        static let privacyAct = Column(CodingKeys.privacyAct)
        static let litigant = Column(CodingKeys.litigant)

        
        
        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)
        
        
    }
    
    static let requests = hasMany(Request.self)

    
}

