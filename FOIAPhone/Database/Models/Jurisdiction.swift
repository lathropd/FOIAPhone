//
//  Juridiction.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import GRDB
import Foundation

/// The Jurisdiction struct.
///
/// Identifiable conformance supports SwiftUI list animations, and type-safe
/// GRDB primary key methods.
/// Equatable conformance supports tests.
struct Jurisdiction: Equatable {
    var id: Int64?
    var name: String
    var text: String
    var hints: String
    var prompt: String

//    var created: Date?
//    var updated: Date?
    
    
    static let databaseColumnDecodingStrategy: DatabaseColumnDecodingStrategy = .convertFromSnakeCase
    static let databaseColumnEncodingStrategy: DatabaseColumnEncodingStrategy = .convertToSnakeCase

    
}

extension Jurisdiction {


}

// MARK: - Database

/// Make Request a Codable Record.
///
/// See <https://github.com/groue/GRDB.swift/blob/master/README.md#records>
extension Jurisdiction: Codable, FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    enum Columns {
        static let name = Column(CodingKeys.name)
        static let text = Column(CodingKeys.text)
        static let hints = Column(CodingKeys.hints)
        static let prompt = Column(CodingKeys.prompt)
        
 //        static let created = Column(CodingKeys.created)
//        static let updated = Column(CodingKeys.updated)

    }
    /// Updates a record id after it has been inserted in the database.
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}
