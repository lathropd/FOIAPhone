//
//  User.swift
//  FOIAPhone
//
//  Created by me on 11/11/25.
//


import Foundation
import GRDB
/// The User  struct.

// MARK: for the time being, User -1 is going to be where we store our user data
struct User: FPRecord, Equatable {
    var id: Int64?
    var fname: String
    var mi: String
    var lname: String
    var email: String
    var method: String
    var verified: Bool
    
    
    var organization: String
    var title: String
    var signature: String


    var description: String
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
        static let verified = Column(CodingKeys.verified)
        static let organization =  Column(CodingKeys.organization)
        static let title = Column(CodingKeys.title)
        
        static let description =  Column(CodingKeys.description)
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

