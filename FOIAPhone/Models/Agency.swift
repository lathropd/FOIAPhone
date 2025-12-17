//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import GRDB

/// The Agency struct.
///
struct Agency: FPRecord, MutablePersistableRecord, FetchableRecord {
    var id: Int64?
    var name: String
    var foiaPortal: String
    var website: String
    var jurisdictionId: Int64
    var muckrockId: Int64?

    var hidden: Bool = false


    var created: Date
    var updated: Date

    // Custom memberwise initializer
    init(id: Int64? = nil, name: String, foiaPortal: String, website: String, jurisdictionId: Int64, muckrockId: Int64?, hidden: Bool = false, created: Date, updated: Date) {
        self.id = id
        self.name = name
        self.foiaPortal = foiaPortal
        self.website = website
        self.jurisdictionId = jurisdictionId
        self.muckrockId = muckrockId
        self.hidden = hidden
        self.created = created
        self.updated = updated
    }

    // GRDB conformance
    static let databaseTableName = "agencies"

    init(row: Row) throws {
        id = row[Columns.id]
        name = row[Columns.name]
        foiaPortal = row[Columns.foiaPortal]
        website = row[Columns.website]
        jurisdictionId = row[Columns.jurisdictionId]
        muckrockId = row[Columns.muckrockId]
        hidden = row[Columns.hidden]
        created = row[Columns.created]
        updated = row[Columns.updated]
    }

    func encode(to container: inout PersistenceContainer) {
        container[Columns.id] = id
        container[Columns.name] = name
        container[Columns.foiaPortal] = foiaPortal
        container[Columns.website] = website
        container[Columns.jurisdictionId] = jurisdictionId
        container[Columns.muckrockId] = muckrockId
        container[Columns.hidden] = hidden
        container[Columns.created] = created
        container[Columns.updated] = updated
    }


    enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let foiaPortal = Column(CodingKeys.foiaPortal)
        static let website = Column(CodingKeys.website)
        static let jurisdictionId = Column(CodingKeys.jurisdictionId)
        static let muckrockId = Column(CodingKeys.muckrockId)
        static let hidden = Column(CodingKeys.hidden)

        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)


    }

    static let jurisdiction = belongsTo(Jurisdiction.self)
    static let contacts = hasMany(Contact.self)
    static let requests = hasMany(Request.self)


}
