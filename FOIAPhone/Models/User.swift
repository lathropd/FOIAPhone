//
//  User.swift
//  FOIAPhone
//
//  Created by me on 11/11/25.
//


import Foundation
import GRDB
/// The User  struct.

// MARK: for the time being, User -1 is to be where we store our user data
struct User: FPRecord, Equatable, MutablePersistableRecord, FetchableRecord {
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

    // Custom memberwise initializer
    init(id: Int64? = nil,
         fname: String,
         mi: String,
         lname: String,
         email: String,
         method: String,
         verified: Bool,
         organization: String,
         title: String,
         signature: String,
         description: String,
         media: Bool,
         nonprofit: Bool,
         academic: Bool,
         political: Bool,
         privacyAct: Bool,
         litigant: Bool,
         created: Date = Date(),
         updated: Date = Date()) {
        self.id = id
        self.fname = fname
        self.mi = mi
        self.lname = lname
        self.email = email
        self.method = method
        self.verified = verified
        self.organization = organization
        self.title = title
        self.signature = signature
        self.description = description
        self.media = media
        self.nonprofit = nonprofit
        self.academic = academic
        self.political = political
        self.privacyAct = privacyAct
        self.litigant = litigant
        self.created = created
        self.updated = updated
    }

    // GRDB conformance
    static let databaseTableName = "user"

    
    
    init(row: Row) throws {
        id = row[Columns.id]
        fname = row[Columns.fname]
        mi = row[Columns.mi]
        lname = row[Columns.lname]
        email = row[Columns.email]
        method = row[Columns.method]
        verified = row[Columns.verified]

        organization = row[Columns.organization]
        title = row[Columns.title]
        signature = row[Columns.signature]

        description = row[Columns.description]
        media = row[Columns.media]
        nonprofit = row[Columns.nonprofit]
        academic = row[Columns.academic]
        political = row[Columns.political]
        privacyAct = row[Columns.privacyAct]
        litigant = row[Columns.litigant]

        created = row[Columns.created]
        updated = row[Columns.updated]
    }

    func encode(to container: inout PersistenceContainer) {
        container[Columns.id] = id
        container[Columns.fname] = fname
        container[Columns.mi] = mi
        container[Columns.lname] = lname
        container[Columns.email] = email
        container[Columns.method] = method
        container[Columns.verified] = verified

        container[Columns.organization] = organization
        container[Columns.title] = title
        container[Columns.signature] = signature

        container[Columns.description] = description
        container[Columns.media] = media
        container[Columns.nonprofit] = nonprofit
        container[Columns.academic] = academic
        container[Columns.political] = political
        container[Columns.privacyAct] = privacyAct
        container[Columns.litigant] = litigant

        container[Columns.created] = created
        container[Columns.updated] = updated
    }


    enum Columns {
        static let id = Column(CodingKeys.id)
        static let fname = Column(CodingKeys.fname)
        static let mi = Column(CodingKeys.mi) // Added
        static let lname = Column(CodingKeys.lname)
        static let email = Column(CodingKeys.email)
        static let method = Column(CodingKeys.method)
        static let verified = Column(CodingKeys.verified)
        static let organization =  Column(CodingKeys.organization)
        static let title = Column(CodingKeys.title)
        static let signature = Column(CodingKeys.signature) // Added

        static let description =  Column(CodingKeys.description)
        static let media = Column(CodingKeys.media)
        static let nonprofit = Column(CodingKeys.nonprofit)
        static let academic = Column(CodingKeys.academic)
        static let political = Column(CodingKeys.political) // Added
        static let privacyAct = Column(CodingKeys.privacyAct)
        static let litigant = Column(CodingKeys.litigant)



        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)


    }

    static let requests = hasMany(Request.self)


}
