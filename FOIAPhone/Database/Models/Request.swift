//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import GRDB
import Foundation

/// The Request struct.
///
/// Identifiable conformance supports SwiftUI list animations, and type-safe
/// GRDB primary key methods.
/// Equatable conformance supports tests.
struct Request: Equatable {
    var id: Int64?
    var name: String
    var records: String
    var text: String
    var method: String
    var status: String
    var notes: String
    var sent: Date?
//    var created: Date?
//    var updated: Date?
    
    
    static let databaseColumnDecodingStrategy: DatabaseColumnDecodingStrategy = .convertFromSnakeCase
    static let databaseColumnEncodingStrategy: DatabaseColumnEncodingStrategy = .convertToSnakeCase

    
}

extension Request {

    
//    /// Creates a new player with empty name and zero score
//    static func new() -> Request {
//        Request(id: nil, name: "", score: 0)
//    }
//    
//    /// Creates a new player with random name and random score
//    static func makeRandom() -> Request {
//        Request(id: nil, name: randomName(), score: randomScore())
//    }
//    

}

// MARK: - Database

/// Make Request a Codable Record.
///
/// See <https://github.com/groue/GRDB.swift/blob/master/README.md#records>
extension Request: Codable, FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    enum Columns {
        static let name = Column(CodingKeys.name)
        static let records = Column(CodingKeys.records)
        static let text = Column(CodingKeys.text)
        static let method = Column(CodingKeys.method)
        static let status = Column(CodingKeys.status)
        static let notes = Column(CodingKeys.notes)
        static let sent = Column(CodingKeys.sent)
//        static let created = Column(CodingKeys.created)
//        static let updated = Column(CodingKeys.updated)

    }
    /// Updates a record id after it has been inserted in the database.
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
    

}
