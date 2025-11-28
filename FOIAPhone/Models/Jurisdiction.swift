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
struct Jurisdiction: FPRecord  {
    var id: Int32?
    var name: String
    var lawName: String
    var muckrockId: Int32?
    var calendarDays: Int
    var businessDays: Int

    var created: Date
    var updated: Date
    
    

    enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let lawName = Column(CodingKeys.lawName)
        static let muckrockId = Column(CodingKeys.muckrockId)
        static let calendarDays = Column(CodingKeys.calendarDays)
        static let businessDays = Column(CodingKeys.businessDays)


        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)

        
    }
    
    static let agencies = hasMany(Agency.self)

}
