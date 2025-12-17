//
//  Juridiction.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import GRDB
/// The Jurisdiction struct.
///
struct Jurisdiction: FPRecord, MutablePersistableRecord, FetchableRecord  {
    var id: Int64?
    var name: String
    var lawName: String
    var muckrockId: Int64?
    var calendarDays: Int?
    var businessDays: Int?

    var residencyRequired: Bool = false
    var hidden: Bool = false


    var created: Date
    var updated: Date

    // Custom memberwise initializer
    init(id: Int64? = nil, name: String, lawName: String, muckrockId: Int64?, calendarDays: Int?, businessDays: Int?, residencyRequired: Bool = false, hidden: Bool = false, created: Date, updated: Date) {
        self.id = id
        self.name = name
        self.lawName = lawName
        self.muckrockId = muckrockId
        self.calendarDays = calendarDays
        self.businessDays = businessDays
        self.residencyRequired = residencyRequired
        self.hidden = hidden
        self.created = created
        self.updated = updated
    }

    // GRDB conformance
    static let databaseTableName = "jurisdictions"

    init(row: Row) throws {
        id = row[Columns.id]
        name = row[Columns.name]
        lawName = row[Columns.lawName]
        muckrockId = row[Columns.muckrockId]
        calendarDays = row[Columns.calendarDays]
        businessDays = row[Columns.businessDays]
        residencyRequired = row[Columns.residencyRequired]
        hidden = row[Columns.hidden]
        created = row[Columns.created]
        updated = row[Columns.updated]
    }

    func encode(to container: inout PersistenceContainer) {
        container[Columns.id] = id
        container[Columns.name] = name
        container[Columns.lawName] = lawName
        container[Columns.muckrockId] = muckrockId
        container[Columns.calendarDays] = calendarDays
        container[Columns.businessDays] = businessDays
        container[Columns.residencyRequired] = residencyRequired
        container[Columns.hidden] = hidden
        container[Columns.created] = created
        container[Columns.updated] = updated
    }


    enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let lawName = Column(CodingKeys.lawName)
        static let muckrockId = Column(CodingKeys.muckrockId)
        static let calendarDays = Column(CodingKeys.calendarDays)
        static let businessDays = Column(CodingKeys.businessDays)
        static let residencyRequired = Column(CodingKeys.residencyRequired)
        static let hidden = Column(CodingKeys.hidden)


        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)


    }

    static let agencies = hasMany(Agency.self)

}
