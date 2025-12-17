//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import GRDB

/// The Request struct.
struct Request: FPRecord, MutablePersistableRecord, FetchableRecord {
    var id: Int64?
    var title: String
    var records: String
    var text: String
    var method: String
    var status: String
    var notes: String
    var sent: Date
    var agencyId: Int64?
    var userId: Int64


    var created: Date
    var updated: Date

    // Custom memberwise initializer
    init(id: Int64? = nil, title: String, records: String, text: String, method: String, status: String, notes: String, sent: Date, agencyId: Int64? = nil, userId: Int64, created: Date = Date(), updated: Date = Date()) {
        self.id = id
        self.title = title
        self.records = records
        self.text = text
        self.method = method
        self.status = status
        self.notes = notes
        self.sent = sent
        self.agencyId = agencyId
        self.userId = userId
        self.created = created
        self.updated = updated
    }

    // GRDB conformance
    static let databaseTableName = "requests"

    init(row: Row) throws {
        id = row[Columns.id]
        title = row[Columns.title]
        records = row[Columns.records]
        text = row[Columns.text]
        method = row[Columns.method]
        status = row[Columns.status]
        notes = row[Columns.notes]
        sent = row[Columns.sent]
        agencyId = row[Columns.agencyId]
        userId = row[Columns.userId]
        created = row[Columns.created]
        updated = row[Columns.updated]
    }

    func encode(to container: inout PersistenceContainer) {
        container[Columns.id] = id
        container[Columns.title] = title
        container[Columns.records] = records
        container[Columns.text] = text
        container[Columns.method] = method
        container[Columns.status] = status
        container[Columns.notes] = notes
        container[Columns.sent] = sent
        container[Columns.agencyId] = agencyId
        container[Columns.userId] = userId
        container[Columns.created] = created
        container[Columns.updated] = updated
    }


    enum Columns {
        static let id = Column(CodingKeys.id)
        static let title = Column(CodingKeys.title)
        static let records = Column(CodingKeys.records)
        static let text = Column(CodingKeys.text)
        static let method = Column(CodingKeys.method)
        static let status = Column(CodingKeys.status)
        static let notes = Column(CodingKeys.notes)
        static let sent = Column(CodingKeys.sent)

        static let agencyId = Column(CodingKeys.agencyId)
        static let userId = Column(CodingKeys.userId)


        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)


    }

    static let agency = belongsTo(Agency.self)
    static let user = belongsTo(User.self)


}
