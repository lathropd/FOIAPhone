//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import GRDB
import Foundation

/// The Agency struct.
///
/// Identifiable conformance supports SwiftUI list animations, and type-safe
/// GRDB primary key methods.
/// Equatable conformance supports tests.
struct Agency: Equatable {
    var id: Int64?
    var name: String
    var contactTitle: String
    var contactName: String
    var contactEmail: String
    var contactPhone: String
    var address: String
    var url: String
    var foiaUrl: String
    var jurisdictionId: Int64?
    


//    var created: Date?
//    var updated: Date?
    
    static let databaseColumnDecodingStrategy: DatabaseColumnDecodingStrategy = .convertFromSnakeCase
    static let databaseColumnEncodingStrategy: DatabaseColumnEncodingStrategy = .convertToSnakeCase

    
}

extension Agency {
    static let requests = hasMany(Request.self)
    static let jurisdiction = hasOne(Jurisdiction.self)



}

// MARK: - Database

extension Agency: Identifiable, Codable, FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    enum Columns {
        static let name = Column(CodingKeys.name)
        static let oontactTitle = Column(CodingKeys.contactTitle)
        static let contactName = Column(CodingKeys.contactName)
        static let contactEmail = Column(CodingKeys.contactEmail)
        static let contactPhone = Column(CodingKeys.contactPhone)
        static let address = Column(CodingKeys.address)
        static let url = Column(CodingKeys.url)
        static let foiaUrl = Column(CodingKeys.foiaUrl)


        
//        static let created = Column(CodingKeys.created)
//        static let updated = Column(CodingKeys.updated)

    }
    /// Updates a record id after it has been inserted in the database.
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
  
}
